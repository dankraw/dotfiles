#!/usr/bin/env bash

DOTFILES=`pwd`

# Colors
ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"

link_file () {
    src=$1
    dst=$2
    dst_dir=`dirname "$dst"`
    mkdir -p $dst_dir
    if [ -e "$dst" ]; then
        if [ "$(readlink $dst)" = "$src" ]; then
            echo "$src is already linked to $dst"
        else
            read -p "$dst already exist. Replace it (y/[N])? " answer
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
    echo -e "${BLUE}Installing git${RESET}"
    USER_NAME=`git config --global user.name`
    if [ "$USER_NAME" = "" ]; then
        read -e -p "Your name: " USER_NAME
    fi

    USER_EMAIL=`git config --global user.email`
    if [ "$USER_EMAIL" = "" ]; then
        read -e -p "Your email: " USER_EMAIL
    fi

    CONFIG=$HOME/.gitconfig
    cp gitconfig $CONFIG
    sed -i.bak s/%USER_NAME%/"$USER_NAME"/g $CONFIG
    sed -i.bak s/%USER_EMAIL%/"$USER_EMAIL"/g $CONFIG
    
    rm "${CONFIG}.bak"
}

install_git_templates() {
    echo -e "${BLUE}Installing git templates${RESET}"
    link_file $DOTFILES/git-templates/ $HOME/.git-templates
    git config --global init.templatedir $HOME/.git-templates
}

install_screen () {
    echo -e "${BLUE}Installing screen${RESET}"
    link_file $DOTFILES/screenrc $HOME/.screenrc
}

install_vim () {
    echo -e "${BLUE}Installing vim${RESET}"
    link_file $DOTFILES/vimrc $HOME/.vimrc
}

install_bash () {
    echo -e "${BLUE}Installing bash${RESET}"
    link_file $DOTFILES/bashrc $HOME/.bashrc
}

install () {
   install_git
   install_git_templates
   install_screen
   install_vim
   install_bash
}

install