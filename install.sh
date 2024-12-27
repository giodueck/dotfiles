#!/bin/sh

# This repo is not meant to go directly into /home/username/,
# instead use this script to move the needed files there

# Move relevant dotfiles into home (~)

cp -v .zshrc ~/.zshrc

mkdir -p ~/.local/share/fzf
cp -v .local/share/fzf/key-bindings.zsh ~/.local/share/fzf/key-bindings.zsh

mkdir -p ~/.config/tmux
cp -rv .config/tmux/* ~/.config/tmux/

mkdir -p ~/.config/alacritty
cp -v .config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

mkdir -p ~/.config/zathura
cp -v .config/zathura/zathurarc ~/.config/zathura/zathurarc

mkdir -p ~/.config/hypr
cp -rv .config/hypr/* ~/.config/hypr/

mkdir -p ~/.config/xdg-desktop-portal
cp -v .config/xdg-desktop-portal/hyprland-portals.conf ~/.config/xdg-desktop-portal/hyprland-portals.conf

mkdir -p ~/.config/waybar
cp -rv .config/waybar/* ~/.config/waybar/

mkdir -p ~/.config/qt6ct
cp -rv .config/qt6ct/* ~/.config/qt6ct/

mkdir -p ~/.config/rofi
cp -rv .config/rofi/* ~/.config/rofi/

mkdir -p ~/.config/naivecalendar
cp -rv .config/naivecalendar/* ~/.config/naivecalendar/

mkdir -p ~/.local/share/naivecalendar/global
cp -rv .local/share/naivecalendar/global/events.cfg ~/.local/share/naivecalendar/global/events.cfg

mkdir -p ~/.config/swaync
cp -rv .config/swaync/* ~/.config/swaync/
