#!/bin/sh

#
# function symlink
#

function symlink() {

    local ln_target="$HOME/Projekte/dotfiles/config"
    local conf="$HOME/.config"

    if [[ -d "$conf/$1" ]]; then
        echo "config folder $1 exists"
    else
        echo "symlink $1 config"
        ln -s "$ln_target/$1" "$conf/$1"
    fi
}

# install needed packages
needed="git zsh tmux neovim bat fzf ripgrep wget lua luarocks ttf-hack-nerd man-db tldr tree"
not_installed=""

for package in $needed; do
    if [[ $(pacman -Qq "$package") != "$package" ]] 2>/dev/null; then
        echo "$package is not installed"
        not_installed+="$package "
    else
        echo "$package is installed"
    fi
done

sudo pacman -S "$not_installed"


# alacritty
echo "$(symlink "alacritty")"

# zsh
echo "$(symlink "zsh")"

if [[ -d "$HOME/.local/share/zap" ]]; then
    echo "zap is installed"
else
    echo "install zap"
    git clone -b "master" https://github.com/zap-zsh/zap.git "$HOME/.local/share/zap"
fi

# tmux
echo "$(symlink "tmux")"

if [[ -d "$HOME/.local/share/tmux/plugins/tpm" ]]; then
    echo "tpm is installed"
else
    echo "install tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
fi

# neovim
echo "$(symlink "nvim")"

# bat
echo "$(symlink "bat")"

