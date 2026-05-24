-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- https://www.gnome-look.org/p/1681315: Tokyonight-Dark-Storm-BL-LB.zip
hl.env("GTK_THEME", "Tokyonight-Dark-Storm:dark")
hl.env("GDK_BACKEND", "wayland,x11,*")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
