#!/usr/bin/env bash

xcode-select --install

# install Homebrew
command -v brew >/dev/null 2>&1 || { 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

# install software using brew
brew bundle

# set fish as default shell
if ! grep -q fish "/etc/shells"; then
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish
fi

