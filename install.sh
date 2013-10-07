#!/bin/bash

DOTFILES=`pwd`

install_git () {
    read -p "Your git user.name: " USER_NAME
    read -p "Your git user.email: " USER_EMAIL

    GIT_CONFIG=$HOME/.gitconfig
    cp gitconfig $GIT_CONFIG
    sed -i.bak s/%USER_NAME%/"$USER_NAME"/g $GIT_CONFIG
    sed -i.bak s/%USER_EMAIL%/"$USER_EMAIL"/g $GIT_CONFIG
    
    rm "${GIT_CONFIG}.bak"
}

install_screen () {
   ln -s $DOTFILES/screenrc $HOME/.screenrc
}

install () {
   install_git
   install_screen 
   echo "Done"
}

echo "Do you wish to install dotfiles?"
echo "Warning: This may override dotfiles existing in your $HOME directory!"
read -p "(Y/n) "  RESP
if [ "$RESP" = "Y" ]; then
    install
fi    

