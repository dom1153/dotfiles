# syntax=docker/dockerfile:1
#
# Fresh Debian environments for testing the dotfiles.
# Stages build on each other: base (Homebrew) -> core (+Brewfile) -> mocha (+Brewfile.mocha)
#
# Build from the repo root (the context must contain brew/):
#   docker build -f test/Dockerfile --target core -t dots:core .
#   docker build -f test/Dockerfile --target mocha -t dots:mocha .
#
# Run (--rm: every run starts from a clean home; the repo is mounted read-only):
#   docker run --rm -it -v ~/.dots:/home/dummy/.dots:ro dots:mocha
#   # inside: cd ~/.dots && stow -R core mocha && exec fish
#
# Podman works the same way: swap `docker` for `podman` (add `,Z` to the -v flag on SELinux hosts).

# ---------------------------------------------------------------------------
# base: Debian + a non-root user + Homebrew, no formulae yet
# ---------------------------------------------------------------------------
FROM debian:stable-slim AS base

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

# Heredoc instead of &&: one command per line, still one layer.
# update and install must share a layer, or a cached stale `apt-get update` breaks later installs.
RUN <<EOF
set -e
apt-get update
apt-get install -y --no-install-recommends build-essential ca-certificates curl file git procps sudo
rm -rf /var/lib/apt/lists/*
EOF

# Homebrew on Linux refuses to run as root
RUN useradd --create-home --uid 1000 --shell /bin/bash dummy
RUN echo 'dummy ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dummy

USER dummy
WORKDIR /home/dummy

RUN NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
ENV HOMEBREW_NO_AUTO_UPDATE=1
ENV HOMEBREW_NO_ANALYTICS=1
ENV HOMEBREW_NO_ENV_HINTS=1

CMD ["bash"]

# ---------------------------------------------------------------------------
# core: what every machine gets (brew/Brewfile)
# ---------------------------------------------------------------------------
FROM base AS core

COPY --chown=dummy:dummy brew/Brewfile /tmp/brew/Brewfile

# The cache mount keeps downloaded bottles out of the image and reuses them across rebuilds
RUN --mount=type=cache,target=/home/dummy/.cache/Homebrew,uid=1000 brew bundle --file=/tmp/brew/Brewfile

CMD ["fish"]

# ---------------------------------------------------------------------------
# mocha: core + dev tools (brew/Brewfile.mocha)
# ---------------------------------------------------------------------------
FROM core AS mocha

COPY --chown=dummy:dummy brew/Brewfile.mocha /tmp/brew/Brewfile.mocha

RUN --mount=type=cache,target=/home/dummy/.cache/Homebrew,uid=1000 brew bundle --file=/tmp/brew/Brewfile.mocha

CMD ["fish"]
