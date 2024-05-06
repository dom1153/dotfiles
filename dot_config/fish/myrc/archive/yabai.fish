### silly little hack, not really the right place to put it but it'll do for my flow
set -l uname $(uname)
if exists yabai
    and ! pgrep yabai &>/dev/null
    and [ $uname = Darwin ]
    yabai --start-service &>/dev/null
end
if exists skhd
    and ! pgrep skhd &>/dev/null
    and [ $uname = Darwin ]
    skhd --start-service &>/dev/null
end
