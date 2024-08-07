# My dotfiles

## Alacritty
Lightly customized for an unintrusive, fast console.

## [Neovim configs](https://github.com/giodueck/nvim)
Merge to this repo pending.

Theming all around adapted from the excellent [TokyoNight.nvim](https://github.com/folke/tokyonight.nvim) by folke, which includes extras for some of these configs.

### Dependencies
```
pacman -S neovim ripgrep fd
```

## Hyprland
Modern tiling WM based on wlroots.

### TODO
- [x] Check bluetooth/wifi settings
- [x] Rofi theme
- [x] Make apps (dolphin) use dark theme
- [x] Lock screen
    - [x] Idle screen lock
    - [x] Lock on laptop lid close
    - [ ] Rice lock screen
- [x] Status bar
    - [ ] KDE Connect
    - [ ] Hide inactive modules into a tray-like module (e.g. bluetooth disabled but not inexistent)
    - [x] Script to detect how many CPUs there are, and whether to enable the bluetooth module
    - [x] Check if rofi can play nicer with the mouse
- [x] Hyprland media keys
- [x] Kill or minimize (Steam)
- [x] Test powermenu.sh
- [x] Check that camera/microphone work
- [x] Check that screen-sharing works
- [x] Screenshots
    - [x] Notifications
- [x] Hyprland theming and animations
- [x] Clipboard manager
- [ ] Nicer notifications
- [ ] Battery low alert
- [ ] Calendar (naive calendar looks cool)
- [ ] Custom wallpaper manager
- [ ] Break out individual components in this readme: waybar, rofi, etc

### Dependencies
```
pacman -S archlinux-xdg-menu bluez-utils brightnessctl cliphist dolphin grim hypridle hyprland hyprlock hyprpaper networkmanager ocean-sound-theme pavucontrol pipewire playerctl polkit polkit-kde-agent qt5-wayland qt5ct qt6-wayland qt6ct rofi-wayland slurp swaync ttf-hack-nerd waybar wireplumber xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-kde xwayland xwaylandvideobridge
```

> [!TIP]
> Make sure any scripts have the execute permission set.

Also, for the bluetooth detection to work, enable the bluetooth service (even if the system does not have a
controller)
```
systemctl enable --now bluetooth
```

## Tmux
Tmux configuration based on [the zen tmux config](https://www.youtube.com/watch?v=DzNmUNvnB04)
and [a guide to customizing your tmux.conf](https://hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/).

### Dependencies
- [tpm](https://github.com/tmux-plugins/tpm)

## Zathura
Document viewer with vi-style keymaps.

### Dependencies
```
pacman -S zathura zathura-pdf-mupdf
```

## Zsh
Zsh config based on the Arch installer image and customized from there.

### Dependencies
```
pacman -S git fzf grml-zsh-config neovim nvidia-prime zsh-autosuggestions zoxide
```

Also sets fzf keybinds in `.local/share/fzf/key-bindings.zsh`

#### AUR
- [minecraft-launcher](https://aur.archlinux.org/packages/minecraft-launcher) (optional, function)
- [smem](https://aur.archlinux.org/packages/smem) (optional, function)
