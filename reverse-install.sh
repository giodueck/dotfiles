#!/bin/sh

# Copy any changes in tracked config files to this repo

cp -v ~/.zshrc .zshrc

mkdir -p .local/share/fzf
cp -v ~/.local/share/fzf/key-bindings.zsh .local/share/fzf/key-bindings.zsh

mkdir -p .config/tmux
cp -rv ~/.config/tmux/*.tmux .config/tmux/
cp -rv ~/.config/tmux/*.conf .config/tmux/

mkdir -p .config/alacritty
cp -v ~/.config/alacritty/alacritty.toml .config/alacritty/alacritty.toml

mkdir -p .config/zathura
cp -v ~/.config/zathura/zathurarc .config/zathura/zathurarc

mkdir -p .config/hypr
cp -rv ~/.config/hypr/* .config/hypr/
rm -fv .config/hypr/conf/environment/include.conf

mkdir -p .config/xdg-desktop-portal
cp -v ~/.config/xdg-desktop-portal/hyprland-portals.conf .config/xdg-desktop-portal/hyprland-portals.conf

mkdir -p .config/waybar
cp -rv ~/.config/waybar/* .config/waybar/

mkdir -p .config/qt6ct
cp -rv ~/.config/qt6ct/* .config/qt6ct/

mkdir -p .config/rofi
cp -rv ~/.config/rofi/* .config/rofi/

mkdir -p .config/naivecalendar
cp -rv ~/.config/naivecalendar/* .config/naivecalendar/

mkdir -p .local/share/naivecalendar/global
cp -rv ~/.local/share/naivecalendar/global/events.cfg .local/share/naivecalendar/global/events.cfg

mkdir -p .config/swaync
cp -rv ~/.config/swaync/* .config/swaync/

mkdir -p .config/ghostty
cp -rv ~/.config/ghostty/* .config/ghostty/

mkdir -p .themes
cp -rv ~/.themes/* .themes

mkdir -p etc/sddm.conf.d
cp -v /etc/sddm.conf.d/* etc/sddm.conf.d

mkdir -p .config/eww
cp -rv ~/.config/eww/* .config/eww/

mkdir -p .config/Vial
cp -rv ~/.config/Vial/* .config/Vial/

mkdir -p .local/bin
cp -rv ~/.local/bin/tmux-sessionizer .local/bin/

mkdir -p .config/tmux-sessionizer
cp -rv ~/.config/tmux-sessionizer/* .config/tmux-sessionizer/
