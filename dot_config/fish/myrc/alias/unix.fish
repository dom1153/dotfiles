abbr untargz 'tar xvf'
abbr cp 'cp -i'
abbr dirsize "du -sh"
abbr l "ls -lh"
abbr la "ls -lah"
abbr hist history
abbr dirsize "du -sh"
abbr dirsizecurrent "echo 'Calculating...'; du -shc ./* | sort -rh"
abbr diffleft "diff --changed-group-format='%<' --unchanged-group-format=''"
abbr diffright "diff --changed-group-format='%>' --unchanged-group-format=''"
switch (uname)
    case Darwin
        abbr where "whereis -a"
    case '*'
        abbr where whereis
end
abbr grep 'grep --color=auto'
abbr fgrep 'fgrep --color=auto'
abbr egrep 'egrep --color=auto'
