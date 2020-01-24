#!/usr/bin/env bash

DOTFILES=$(pwd)

link_file () {
    src=$1
    dst=$2
    dst_dir=$(dirname "$dst")
    mkdir -p $dst_dir
    if [ -e "$dst" ]; then
        if [ "$(readlink $dst)" = "$src" ]; then
            echo "$src is already linked to $dst"
        else
            read -r -p "$dst already exist. Replace it (y/[N])? " answer
            case ${answer:0:1} in
                y|Y )
                    echo "Removing $dst"
                    rm "$dst"
                    echo "Linking $src to $dst"
                    ln -s "$src" "$dst"
                ;;
                * )
                    echo "$dst not replaced"
                ;;
            esac
        fi
    else
        echo "Linking $src to $dst"
        ln -s "$src" "${dst}"
    fi
}


install_git () {
    USER_NAME=$(git config --global user.name)
    if [ "$USER_NAME" = "" ]; then
        read -r -e -p "Your name: " USER_NAME
    fi

    USER_EMAIL=$(git config --global user.email)
    if [ "$USER_EMAIL" = "" ]; then
        read -r -e -p "Your email: " USER_EMAIL
    fi

    CONFIG=$HOME/.gitconfig
    cp gitconfig "$CONFIG"
    sed -i.bak s/%USER_NAME%/"$USER_NAME"/g "$CONFIG"
    sed -i.bak s/%USER_EMAIL%/"$USER_EMAIL"/g "$CONFIG"
    
    rm "${CONFIG}.bak"
}

install_git_templates() {
    link_file "$DOTFILES"/git-templates/ "$HOME"/.git-templates
    git config --global init.templatedir "$HOME"/.git-templates
}

install_screen () {
    link_file "$DOTFILES"/screenrc "$HOME"/.screenrc
}

install_vim () {
    link_file "$DOTFILES"/vimrc "$HOME"/.vimrc
}

install_bash () {
    link_file "$DOTFILES"/bashrc "$HOME"/.bashrc
}

install_fish_functions () {
    mkdir -p "$HOME"/.config/fish/functions
    cp fish/functions/*.fish "$HOME"/.config/fish/functions
}

install () {
   install_git
   install_git_templates
   install_screen
   install_vim
   install_bash
   install_fish_functions
}

install
