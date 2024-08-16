#!/usr/bin/env nix-shell
#!nix-shell -i fish --packages fish jq nodePackages_latest.nodejs

### description: grab every package.json and grab the package description from npm
###              then write it to a tmp file to cache (since each line queries with npm view)

rm -f /tmp/npm_packages.txt
set deps $(npm list --json | jq '.dependencies | keys []')
for p in $deps
    set pp $(echo $p | tr -d '"')
    # echo $p $pp
    set result $(npm view $pp description 2>&1)
    set s $status
    if test $s -eq 1
        set result "❗<error>"
    end
    echo $p: $result | tee -a /tmp/npm_packages.txt
end
echo "Wrote output to /tmp/npm_packages.txt"
