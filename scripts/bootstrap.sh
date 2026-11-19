#!/usr/bin/env bash
# Set up a fresh machine (Debian/Ubuntu, Fedora, Bazzite/other image-based Fedora, macOS):
#   1. system packages Homebrew needs
#   2. Homebrew
#   3. brew bundle (brew/Brewfile, plus brew/Brewfile.<theme>)
#   4. stow core (plus the theme package)
#   5. a line in ~/.bashrc (~/.zshrc on macOS) that sources ~/.localrc
#
# Safe to rerun: each step skips what's already done.
# Must run on macOS's bash 3.2: no associative arrays, mapfile, ${var,,}.

set -euo pipefail

###############################################################################
# Globals
###############################################################################

DOTS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
SHELL_RC_TARGET="$HOME/.localrc"

OS=""          # darwin | debian | fedora | ostree | unknown (set by detect_os)
THEME=""       # mocha | latte | "" (core only)
DO_DEPS=1
DO_BUNDLE=1
DO_STOW=1
DO_HOOK=1

###############################################################################
# Helpers
###############################################################################

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33mwarning:\033[0m %s\n' "$*" >&2; }
die()  { printf '\033[1;31merror:\033[0m %s\n' "$*" >&2; exit 1; }

has() { command -v "$1" >/dev/null 2>&1; }

usage() {
    cat <<EOF
Usage: scripts/bootstrap.sh [options]

Options:
  -t, --theme NAME   also bundle and stow a theme package: mocha | latte
      --no-deps      skip system packages (apt/dnf)
      --no-bundle    skip brew bundle
      --no-stow      skip stow
      --no-hook      skip the ~/.bashrc / ~/.zshrc line
  -h, --help         show this help
EOF
}

parse_args() {
    while [ $# -gt 0 ]; do
        case $1 in
            -t | --theme)
                [ $# -ge 2 ] || die "$1 needs a value"
                THEME=$2
                shift
                ;;
            --theme=*)   THEME=${1#*=} ;;
            --no-deps)   DO_DEPS=0 ;;
            --no-bundle) DO_BUNDLE=0 ;;
            --no-stow)   DO_STOW=0 ;;
            --no-hook)   DO_HOOK=0 ;;
            -h | --help) usage; exit 0 ;;
            *) usage >&2; die "unknown option: $1" ;;
        esac
        shift
    done

    case $THEME in
        "" | mocha | latte) ;;
        *) die "unknown theme: $THEME (expected mocha or latte)" ;;
    esac
}

###############################################################################
# Steps
###############################################################################

detect_os() {
    if [ "$(uname -s)" = Darwin ]; then
        OS=darwin
    elif [ -e /run/ostree-booted ]; then
        # Bazzite, Silverblue, ...: no dnf, and Homebrew usually comes with the image
        OS=ostree
    elif [ -r /etc/os-release ]; then
        # shellcheck disable=SC1091
        . /etc/os-release
        case " ${ID:-} ${ID_LIKE:-} " in
            *" debian "* | *" ubuntu "*) OS=debian ;;
            *" fedora "* | *" rhel "*)   OS=fedora ;;
            *) OS=unknown ;;
        esac
    else
        OS=unknown
    fi
    info "Detected OS: $OS"
}

install_system_deps() {
    info "Installing system packages"
    case $OS in
        debian)
            sudo apt-get update
            sudo apt-get install -y build-essential procps curl file git
            ;;
        fedora)
            sudo dnf group install -y development-tools
            sudo dnf install -y procps-ng curl file git
            ;;
        darwin)
            # The Homebrew installer installs the Xcode Command Line Tools itself
            info "Nothing to do on macOS"
            ;;
        ostree)
            info "Image-based system: skipping (layer packages with rpm-ostree if anything is missing)"
            ;;
        *)
            warn "Unknown OS: install build tools, procps, curl, file and git yourself"
            ;;
    esac
}

# Print the path of the first brew binary found; fails if there's none
find_brew() {
    local brew
    for brew in /opt/homebrew/bin/brew /usr/local/bin/brew \
        /home/linuxbrew/.linuxbrew/bin/brew "$HOME/.linuxbrew/bin/brew"; do
        if [ -x "$brew" ]; then
            echo "$brew"
            return 0
        fi
    done
    return 1
}

install_brew() {
    if find_brew >/dev/null; then
        info "Homebrew already installed: $(find_brew)"
        return 0
    fi

    info "Installing Homebrew"
    # NONINTERACTIVE skips the "press RETURN" prompt but can't ask for a password: cache sudo first
    sudo -v
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Put brew on PATH for the rest of this script
load_brew() {
    local brew
    brew=$(find_brew) || die "brew not found after install"
    eval "$("$brew" shellenv bash)"
    export HOMEBREW_NO_ENV_HINTS=1
}

brew_bundle() {
    local file
    for file in Brewfile ${THEME:+Brewfile.$THEME}; do
        info "brew bundle: brew/$file"
        brew bundle --file="$DOTS_DIR/brew/$file"
    done
}

stow_packages() {
    has stow || die "stow not found (it's in brew/Brewfile; rerun without --no-bundle)"

    # Theme package last, so its --override files (see .stowrc) win over core's
    local packages="core${THEME:+ $THEME}"
    info "Stowing: $packages"
    # .stowrc is read from the current folder
    # shellcheck disable=SC2086  # word splitting of $packages is intended
    (cd "$DOTS_DIR" && stow -R $packages)
}

# Append one line sourcing the stowed ~/.localrc, unless it's already there
hook_shell_rc() {
    local rc
    case $OS in
        darwin) rc="$HOME/.zshrc" ;;   # macOS's default shell is zsh
        *)      rc="$HOME/.bashrc" ;;
    esac

    # $HOME stays literal in the file
    # shellcheck disable=SC2016
    local line='[ -f "$HOME/.localrc" ] && . "$HOME/.localrc"'

    if [ -f "$rc" ] && grep -qF '.localrc' "$rc"; then
        info "$rc already sources ~/.localrc"
        return 0
    fi

    info "Adding ~/.localrc to $rc"
    # Creates the file if missing (a fresh macOS has no ~/.zshrc)
    printf '\n# dotfiles: brew, then exec fish for interactive shells (%s)\n%s\n' \
        "$DOTS_DIR/core/.localrc" "$line" >>"$rc"

    [ -f "$SHELL_RC_TARGET" ] || warn "$SHELL_RC_TARGET doesn't exist yet: stow core to create it"
}

###############################################################################
# Main
###############################################################################

main() {
    parse_args "$@"
    detect_os

    if [ "$DO_DEPS" = 1 ]; then install_system_deps; fi
    install_brew
    load_brew
    if [ "$DO_BUNDLE" = 1 ]; then brew_bundle; fi
    if [ "$DO_STOW" = 1 ]; then stow_packages; fi
    if [ "$DO_HOOK" = 1 ]; then hook_shell_rc; fi

    info "Done. Open a new terminal (or: exec bash -l) to start fish."
}

main "$@"
