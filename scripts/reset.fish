#!/usr/bin/env -S fish --no-config
# Move the ~/.config folders the packages provide (e.g. bat, git) into a backup folder.
# Usage: scripts/reset.fish

# cd to repository root
cd (status dirname)/..; or exit 1

set backup_destination ~/dots-(date +%Y-%m-%d-%H-%M-%S).bak
set packages core latte mocha

set folders_to_move
for package in $packages
    for folder in $package/.config/*
        set relative_path (string replace -- $package/ "" $folder)
        set home_relative_path ~/$relative_path

        # -o -L is useful for broken symlinks
        if test -e $home_relative_path -o -L $home_relative_path
            and not contains -- $relative_path $folders_to_move
            set -a folders_to_move $relative_path
        end
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
        set relative_file (string replace -- $home_folder/ "" $file)
        set tracked false
        for package in $packages
            if test -e $package/$relative_path/$relative_file
                set tracked true
                break
            end
        end
        if $tracked
            echo "    $relative_file"
        else
            echo "    $relative_file "(set_color yellow)"(untracked)"(set_color normal)
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
