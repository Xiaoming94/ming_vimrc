#!/bin/bash

# AUTHOR: Xiaoming94
# Partial script for setting up vim.
# This is so setting up will be easier on other platforms

# Setting up variables

REPO_ROOT=$(cd -- "$(dirname -- "$0")" && pwd)
source "$REPO_ROOT/link_common.sh"

vimplug_path="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim

echo "===== Setting up neovim ====="

install_vimplug "$vimplug_path"

link_common_vimrc

echo "Downloading all the plugins"
ln -sf $REPO_ROOT/nvim $HOME/.config/nvim

nvim +'PlugInstall --sync' +qa
echo "===== INSTALLATION COMPLETE ====="
