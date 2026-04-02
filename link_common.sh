#!/bin/bash

function install_vimplug() {
    local target_path="$1"

    echo "INSTALLING VIM-PLUG TO $target_path\n"

    curl -fLo "$target_path" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
        || echo "curl is not installed, install curl"
}

function link_common_vimrc() {
    local vimrc_d_link=$HOME/.vimrc.d

    local repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

    echo "Creating symlink to common vim configs"

    if [[ ! -d "$vimrc_d_link" ]]; then
        ln -sf "$repo_dir/vimrc.d" "$vimrc_d_link"
    elif [[ ! -f "$vimrc_d_link"/common.vim ]]; then
        echo "$vimrc_d_link exists, but is not the one we expect"
        (rm "$vimrc_d_link" || rm -rf "$vimrc_d_link") &&
            ln -sf "$repo_dir/vimrc.d" "$vimrc_d_link"
    else
        echo "Symlink for common vim configurations exist"
    fi
}
