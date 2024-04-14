#!/bin/sh

# Copy any changes in tracked config files to this repo

cp -v ~/.zshrc .zshrc

mkdir -p .local/share/fzf
cp -v ~/.local/share/fzf/key-bindings.zsh .local/share/fzf/key-bindings.zsh

mkdir -p .config/tmux
cp -v ~/.config/tmux/tmux.conf .config/tmux/tmux.conf
cp -v ~/.config/tmux/tokyonight_night.tmux .config/tmux/tokyonight_night.tmux

mkdir -p .config/alacritty
cp -v ~/.config/alacritty/alacritty.toml .config/alacritty/alacritty.toml
