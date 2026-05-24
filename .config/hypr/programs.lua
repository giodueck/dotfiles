--- Global defines for the config

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use

terminal             = "alacritty"
terminalAlt          = "ghostty --gtk-single-instance=true"
fileManager          = "nautilus"
menu                 = "killall rofi || rofi -show drun -icon-theme breeze-dark"
windowSwitcher       = "killall rofi || rofi -show window -icon-theme breeze-dark"
browser              = "firefox"
browser2             = "chromium --disable-features=WaylandWpColorManagerV1"
clipboardManager     = "killall rofi || cliphist list | rofi -dmenu | cliphist decode | wl-copy"
passwordManager      = "bitwarden-desktop"
messagingPlatform    = "gio launch ~/.local/share/applications/teams-pwa"
messagingPlatformAlt = "gio launch ~/.local/share/applications/odoo-pwa"
powerMenu            = "killall rofi; bash ~/.config/waybar/scripts/power-menu/powermenu.sh"
bluetoothMenu        = "killall rofi; bash ~/.config/waybar/scripts/rofi-bluetooth"
wifiMenu             = "killall rofi; bash ~/.config/waybar/scripts/rofi-wifi-menu.sh"
