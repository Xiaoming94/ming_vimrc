#!/bin/bash

# AUTHOR: Xiaoming94
# Partial script for setting up vim.
# This is so setting up will be easier on other platforms

# Setting up variables
REPO_ROOT=$(cd -- "$(dirname -- "$0")" && pwd)

echo "===== Setting up vim ====="

# Setting up vim with vim-plugs

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
            || echo "curl is not installed, install curl"

# Setting up symlinks
ln -sf $REPO_ROOT/vimrc.d $HOME/.vimrc.d
ln -sf $REPO_ROOT/vimrc $HOME/.vimrc
touch $HOME/.vimrc.user

vim +'PlugInstall --sync' +qa
