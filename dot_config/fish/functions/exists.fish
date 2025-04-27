### desc: check if command exists
function exists
    if ! type -q $argv[1]
        return 1
    end
end
