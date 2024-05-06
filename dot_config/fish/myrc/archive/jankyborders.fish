### silly little hack, not really the right place to put it but it'll do for my flow
set -l uname $(uname)
if exists borders
    and ! pgrep borders &>/dev/null
    and [ $uname = Darwin ]
    brew services start borders &>/dev/null
end
