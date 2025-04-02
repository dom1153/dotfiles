### simple util function to do the type thing
function exists
    if ! type -q $argv[1]
        return 1
    end
end
