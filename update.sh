#!/bin/bash

echo "Updating LSP repositories..."

for dir in ~/.lsp/*
do
    if [ -d "$dir/.git" ]; then
        repo_name=$(basename "$dir")
        echo "Checking updates for $repo_name..."

        # Capture the output of git pull
        git_output=$(git -C "$dir" pull)

        # Check if the repository is already up to date
        if echo "$git_output" | grep -q "Already up to date."; then
            echo "$repo_name is already up to date, skipping build..."
        else
            # Check if there's a specific build script for the repository
            if [ -f "$dir/build.sh" ]; then
                echo "Running build script for $repo_name..."
                chmod +x "$dir/build.sh"
                "$dir/build.sh"
            fi
        fi
    fi
done

echo -e "\nUpdating and upgrading system packages..."
sudo apt update
sudo apt upgrade -y
