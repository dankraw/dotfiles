#!/usr/bin/env bash

DOTFILES=$(pwd)

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
    mkdir -p "$HOME/.git-templates/hooks"
    cp "$DOTFILES"/git-templates/hooks/* "$HOME"/.git-templates/hooks/
    git config --global init.templatedir "$HOME"/.git-templates
}

install_screen () {
    cp "$DOTFILES"/screenrc "$HOME"/.screenrc
}

install_vim () {
    cp "$DOTFILES"/vimrc "$HOME"/.vimrc
}

install_bash () {
    cp "$DOTFILES"/bashrc "$HOME"/.bashrc
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
