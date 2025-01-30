set fish_greeting ""

### source other files
set -l myfh "$HOME/.config/fish/myrc"

### is-interactive block?

### (fyi, fish's "functions" folder reloads with main config)

### source aliases
for f in (ls -d $myfh/alias/* )
    source $f
end

for f in (ls -d $myfh/features/* )
    source $f
end
