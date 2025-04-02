switch (uname)
    case Darwin
        if type -q colima; and colima status &>/dev/null | grep -q Running
            set -gx DOCKER_HOST "unix://$HOME/.colima/default/docker.sock"
        end
    case '*'
end
