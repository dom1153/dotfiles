### let `man` pages use bat instead
### https://github.com/sharkdp/bat#man
if type "bat" >/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c" ### should fix some formatting issues
fi