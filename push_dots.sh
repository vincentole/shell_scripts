#!/bin/bash

function add_and_push {
    git add .
    git commit -m 'update config'
    git push
}

function push_folder {
    echo -e "\n\n$1:"
    cd ~/.config/$1/ || return
    add_and_push
    cd - || return
}

push_folder nvim
push_folder kitty
push_folder fish
push_folder sh
push_folder helix

cd ~ || exit
