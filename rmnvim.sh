#!/bin/bash

echo "Deleting Neovim directories..."

rm -rf ~/.config/nvim
mkdir ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

echo "Deleted the following directories:"
echo "~/.config/nvim"
echo "~/.local/share/nvim"
echo "~/.local/state/nvim"
echo "~/.cache/nvim"
echo ""
echo "Created the following directory:"
echo "~/.config/nvim"
