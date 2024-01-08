#!/bin/bash

function clone_or_pull {
    local repo_url=$1
    local dir=$2

    if [ -d "$dir" ]; then
        if [ -d "$dir/.git" ]; then
            echo "Repository exists in $dir, pulling changes..."
            git -C "$dir" pull
        else
            echo "$dir exists but is not a Git repository. Skipping..."
        fi
    else
        echo "Cloning repository into $dir..."
        git clone "$repo_url" "$dir"
    fi
}

function add_and_push {
    git add . && git commit -m 'update config' && git push
}

function process_folder {
    local action=$1
    local folder=$2
    local repo_url=$3

    echo -e "\n\nProcessing $folder..."

    case "$action" in
        pull)
            clone_or_pull "$repo_url" "$folder"
            ;;
        push)
            (cd "$folder" && add_and_push) || echo "Failed to push changes for $folder"
            ;;
        *)
            echo "Invalid action. Use 'pull' or 'push'."
            exit 1
            ;;
    esac
}

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [pull|push]"
    exit 1
fi

# Replace the URLs with your actual repository URLs
process_folder "$1" ~/.config/nvim "https://github.com/vincentole/nvim.git"
process_folder "$1" ~/.config/kitty "https://github.com/vincentole/kitty.git"
process_folder "$1" ~/.config/fish "https://github.com/vincentole/fish.git"
process_folder "$1" ~/.config/helix "https://github.com/vincentole/helix.git"
process_folder "$1" ~/.shell_scripts "https://github.com/vincentole/shell_scripts.git"
