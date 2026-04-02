#!/bin/bash

# AUTHOR: Xiaoming94
# Partial script for setting up vim.
# This is so setting up will be easier on other platforms

# Setting up variables
REPO_ROOT=$(cd -- "$(dirname -- "$0")" && pwd)
source "$REPO_ROOT/link_common.sh"

echo "===== Setting up vim ====="

# Setting up vim with vim-plugs
vimplug_path="~/.vim/autoload/plug.vim"

install_vimplug "$vimplug_path"

link_common_vimrc

echo "Downloading all the plugins"

ln -sf $REPO_ROOT/vimrc $HOME/.vimrc
touch $HOME/.vimrc.user

vim +'PlugInstall --sync' +qa
echo "===== INSTALLATION COMPLETE ====="
