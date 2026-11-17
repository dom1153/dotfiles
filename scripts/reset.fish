#!/usr/bin/env -S fish --no-config
# Move the ~/.config folders a package provides (e.g. bat, git) into a backup folder.
# Usage: scripts/reset.fish [package]   (default: core)

set backup_destination ~/dots-(date +%Y-%m-%d-%H-%M-%S).bak

# cd to repository root
cd (status dirname)/..; or exit 1

if test (count $argv) -gt 1
    echo "Usage: scripts/reset.fish [package]"
    exit 1
end

# TODO: scan all packages, by list
# default to 'core'
set package core
if set -q argv[1]
    set package $argv[1]
end

set folders_to_move
for folder in $package/.config/*
    set relative_path (string replace -- "$package/" "" $folder)
    set home_relative_path ~/$relative_path

    # -o -L is useful for broken symlinks
    if test -e $home_relative_path -o -L $home_relative_path
        set -a folders_to_move $relative_path
    end
end

if test (count $folders_to_move) -eq 0
    echo "Nothing to move."
    exit 0
end

echo "The following folders will be moved to $backup_destination:"
for relative_path in $folders_to_move
    set home_folder ~/$relative_path
    echo "  $relative_path/"

    # list tracked and untracked files
    for file in (find $home_folder \( -type f -o -type l \) -print0 | string split0)
        set relative_file (string replace -- "$home_folder/" "" $file)
        if test -e $package/$relative_path/$relative_file
            echo "    $relative_file"
        else
            echo "    $relative_file (untracked)"
        end
    end
end

read -l -P "Continue? [y/N] " answer
if not string match -qir '^y(es)?$' -- $answer
    echo Aborted.
    exit 1
end

for relative_path in $folders_to_move
    mkdir -p (path dirname $backup_destination/$relative_path)
    and mv ~/$relative_path $backup_destination/$relative_path
end
echo Done.
