# My dotfiles

Not all configured programs are listed here, only the ones which have some dependencies or special configuration requirements.

## [Neovim configs](https://github.com/giodueck/nvim)
Merge to this repo pending.

Theming all around adapted from the excellent [TokyoNight.nvim](https://github.com/folke/tokyonight.nvim) by folke, which includes extras for some of these configs.

### Dependencies
```
pacman -S neovim ripgrep fd
```

## Hyprland
Modern tiling WM based on wlroots.

### Dependencies
```
pacman -S archlinux-xdg-menu bluez-utils brightnessctl cliphist nautilus grim hypridle hyprland hyprlock hyprpaper networkmanager ocean-sound-theme pavucontrol pipewire playerctl polkit polkit-kde-agent qt5-wayland qt5ct qt6-wayland qt6ct rofi-wayland slurp socat swaync ttf-hack-nerd waybar wireplumber xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-kde kvantum-qt5
```
#### Manual build:
- naivecalendar:
```shell
git clone https://framagit.org/Daguhh/naivecalendar
cd naivecalendar
make install
```

- eww:
AUR: https://aur.archlinux.org/packages/eww

### GTK Theme
The theme included in `.themes` is Tokyonight-Storm (https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme).

### Setup
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

### Sessionizer
The `tmux-sessionizer` script was copied from The Primeagen: https://github.com/ThePrimeagen/tmux-sessionizer/

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

## SDDM Theme
```
git clone https://aur.archlinux.org/simple-sddm-theme-2-git.git
cd simple-sddm-theme-2-git
makepkg
sudo pacman -U simple-sddm-theme-2-git-_-1-any.pkg.tar.zst
```

This should install the theme under `/usr/share/sddm/themes`. The setting of the theme is not actually a dotfile per se,
as it is user independent and stored under `/etc/sddm.conf.d`, but this stays here until I decide to do an ansible setup
or something.

To change the background, adjust in `/usr/share/sddm/themes/simple-sddm-2/theme.conf`.

## Keyboard layout

The keyboard layouts in `.config/Vial/` are not dotfiles per-se, but they are Vial configuration/layout files that can be loaded into a keyboard.
