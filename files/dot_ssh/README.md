# This usually contains the following files:

`config` - mapping for ssh `<machine>` names
`<machine_name>` - identity file (private key), begins with `-----BEGIN OPENSSH PRIVATE KEY-----`
`<machine_name>.pub` - goes to the other machines, stored in `known_hosts`
