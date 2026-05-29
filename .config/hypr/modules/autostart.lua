-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1 &")

    hl.exec_cmd("swaync &")

    hl.exec_cmd("~/.config/hypr/scripts/waybar-dynamic-config.sh")
    hl.exec_cmd("waybar 2>/tmp/stderr >/tmp/stdout &")

    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("hypridle &")

    hl.exec_cmd("~/.config/hypr/scripts/eww-open-all.sh &")

    hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6 &")
    hl.exec_cmd("kdeconnectd &")
    hl.exec_cmd("kdeconnect-indicator &")

    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")

    hl.exec_cmd("ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false &")

    hl.exec_cmd("~/.config/hypr/scripts/event-handler.sh &")

    -- GTK theming
    -- GTK3
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Tokyonight-Dark-Storm:dark\"")
    -- GTK4
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
end)
