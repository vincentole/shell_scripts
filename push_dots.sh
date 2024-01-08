#!/bin/bash

function add_and_push {
    git add . && git commit -m 'update config' && git push
}

function push_folder {
    echo -e "\n\nPushing changes in $1..."
    (cd "$2" && add_and_push) || echo "Failed to push changes for $1"
}

push_folder nvim ~/.config/nvim
push_folder kitty ~/.config/kitty
push_folder fish ~/.config/fish
push_folder helix ~/.config/helix
push_folder shell_scripts ~/.shell_scripts
