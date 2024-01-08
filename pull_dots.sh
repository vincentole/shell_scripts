#!/bin/bash

function clone_or_pull {
    local repo_url=$1
    local dir=$2

    echo -e "\n\nProcessing $dir..."

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

# Replace the URLs with your actual repository URLs
clone_or_pull "https://github.com/vincentole/nvim.git" ~/.config/nvim
clone_or_pull "https://github.com/vincentole/kitty.git" ~/.config/kitty
clone_or_pull "https://github.com/vincentole/fish.git" ~/.config/fish
clone_or_pull "https://github.com/vincentole/helix.git" ~/.config/helix
clone_or_pull "https://github.com/vincentole/shell_scripts.git" ~/.shell_scripts
