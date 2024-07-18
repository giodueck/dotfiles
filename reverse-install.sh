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

mkdir -p .config/zathura
cp -v ~/.config/zathura/zathurarc .config/zathura/zathurarc

mkdir -p .config/hypr
cp -v ~/.config/hypr/hyprland.conf .config/hypr/hyprland.conf
mkdir -p .config/xdg-desktop-portal
cp -v ~/.config/xdg-desktop-portal/hyprland-portals.conf .config/xdg-desktop-portal/hyprland-portals.conf
