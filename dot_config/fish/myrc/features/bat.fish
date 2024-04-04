### let `man` pages use bat instead
### https://github.com/sharkdp/bat#man
if type bat &>/dev/null
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT -c ### should fix some formatting issues
end
