# My dotfiles

## Alacritty
Lightly customized for an unintrusive, fast console.

## [Nvim configs](https://github.com/giodueck/nvim)
Merge to this repo pending.

Theming all around adapted from the excellent [TokyoNight.nvim](https://github.com/folke/tokyonight.nvim) by folke, which includes extras for some of these configs.

## Hyprland
Modern tiling WM based on wlroots.

### TODO
- [x] Check bluetooth/wifi settings
- [x] Rofi theme
- [x] Make apps (dolphin) use dark theme
- [x] Lock screen
    - [x] Idle screen lock
    - [ ] Lock on laptop lid close
    - [ ] Rice lock screen
- [x] Status bar
    - [ ] KDE Connect
    - [ ] Hide inactive modules into a tray-like module (e.g. bluetooth disabled)
- [x] Hyprland media keys
- [x] Kill or minimize (Steam)
- [ ] Test powermenu.sh
- [ ] Check that camera/microphone work
- [ ] Check that screen-sharing works
- [ ] Hyprland theming and animations
- [ ] Screenshots
- [ ] Custom wallpaper manager
- [ ] Break out individual components: waybar, rofi, etc

### Dependencies
- bluez-utils
- brightnessctl
- dolphin
- hypridle
- hyprland
- hyprlock
- hyprpaper
- networkmanager
- pavucontrol
- pipewire
- playerctl
- polkit
- polkit-kde-agent
- qt5-wayland
- qt5ct
- qt6-wayland
- qt6ct
- rofi-wayland
- swaync
- waybar
- wireplumber
- xdg-desktop-portal
- xdg-desktop-portal-hyprland
- xdg-desktop-portal-kde

## Tmux
Tmux configuration based on [the zen tmux config](https://www.youtube.com/watch?v=DzNmUNvnB04)
and [a guide to customizing your tmux.conf](https://hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/).

### Dependencies
- [tpm](https://github.com/tmux-plugins/tpm)

## Zathura
Document viewer with vi-style keymaps.

## .zshrc
Zsh config based on the Arch installer image and customized from there.

### Dependencies
- [fzf](https://github.com/junegunn/fzf)
- git (duh)
- [grml-zsh-config](https://archlinux.org/packages/?name=grml-zsh-config) (Arch package)
- [minecraft-launcher](https://aur.archlinux.org/packages/minecraft-launcher) (optional, function)
- [neovim](https://github.com/neovim/neovim) (optional, alias)
- [nvidia-prime](https://archlinux.org/packages/extra/any/nvidia-prime/) (optional, function)
- [smem](https://www.selenic.com/smem/) (optional, function)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
