#!/bin/bash

########
# nvim #
########
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"

# Install Neovim plugin manager, vim-plug:
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#mkdir -p "XDG_CONFIG_HOME/nvim/autoload"
mkdir -p "$XDG_DATA_HOME/nvim/site/autoload/"
#ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_DATA_HOME/nvim/site/autoload/plug.vim"

# Install (or updte) all the plugins
nvim --noplugin +PlugUpdate +qa

#######
# X11 #
#######
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

########
#  i3  #
########

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

#######
# zsh #
#######

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"

# Zsh autocompletion improvement
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

#########
# Fonts #
#########

mkdir -p "XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

########
# dunst#
########

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"
