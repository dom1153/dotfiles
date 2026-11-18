#!/usr/bin/env bash
# Stow each profile into an empty temp folder and report conflicts and broken links.
# Never touches ~: only the target changes, .stowrc (repo root) still applies.
#
# Usage: test/stow-test.sh [-v] [profile...]   (default: every profile)
#   -v  print stow's per-link output
# Exit code: 0 if every profile passed, 1 otherwise.

set -uo pipefail

# Profile -> packages, in stow order (machine package last, so its --override files win).
declare -A PROFILES=(
    [core]="core"
    [mocha]="core mocha"
    [latte]="core latte"
)
ORDER=(core mocha latte)

verbose=0
if [[ ${1:-} == -v ]]; then verbose=1; shift; fi

repo=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo" || exit 1   # stow reads .stowrc from the current folder

command -v stow >/dev/null || { echo "stow not found" >&2; exit 1; }

selected=("$@")
((${#selected[@]})) || selected=("${ORDER[@]}")

failed=0
for profile in "${selected[@]}"; do
    if [[ -z ${PROFILES[$profile]+x} ]]; then
        echo "unknown profile: $profile (known: ${ORDER[*]})" >&2
        failed=1
        continue
    fi
    read -ra packages <<<"${PROFILES[$profile]}"

    target=$(mktemp -d)
    output=$(stow -v -t "$target" -R "${packages[@]}" 2>&1)
    status=$?
    broken=$(cd "$target" && find . -xtype l)
    links=$(find "$target" -type l | wc -l)
    rm -rf "$target"

    if ((status == 0)) && [[ -z $broken ]]; then
        printf 'PASS  %-12s %3d links  (%s)\n' "$profile" "$links" "${packages[*]}"
        ((verbose)) && sed 's/^/      /' <<<"$output"
    else
        printf 'FAIL  %-12s (%s)\n' "$profile" "${packages[*]}"
        if ((verbose)); then
            sed 's/^/      /' <<<"$output"
        else
            grep -vE '^(LINK|UNLINK|MKDIR|RMDIR):' <<<"$output" | sed 's/^/      /'
        fi
        [[ -n $broken ]] && sed 's/^/      broken link: /' <<<"$broken"
        failed=1
    fi
done

exit "$failed"
