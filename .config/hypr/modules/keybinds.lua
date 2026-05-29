------------------
---- KEYBINDS ----
------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Close window
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("~/.config/hypr/scripts/kill-or-minimize.sh"))

-- Exit Hyprland
hl.bind(mainMod .. " + Delete", hl.dsp.exit())

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(terminalAlt))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd(windowSwitcher))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(browser2))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(passwordManager))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(messagingPlatform))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(messagingPlatformAlt))

-- On laptop lid
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })

-- Lock such that, even when the lockscreen dies, it can be relaunched
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("killall hyprlock; hyprlock"), { locked = true })

-- Move focus with mainMod + HL
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Cycle windows, useful when there is a mix of floating and tiled, or when multimonitor wants to focus a neighboring workspace instead of the next window
-- -- these don't work like they used to <0.55
-- hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.cycle_next({ prev = true }))
-- hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.alter_zorder({ mode = "top" }))
-- hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.cycle_next())
-- hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.alter_zorder({ mode = "top" }))

hl.bind(mainMod .. " + CTRL + H", hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.layout("focus r"))

-- Move to previous/next workspace with mainMod + JK
hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = "m-1" }))

-- Cycle windows
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + TAB", hl.dsp.window.alter_zorder({ mode = "top" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move window
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))

-- Resize column to one of the predefined values
hl.bind(mainMod .. " + Left", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + Right", hl.dsp.layout("colresize +conf"))

-- Special workspace: scratchpad
hl.bind(mainMod .. " + C", hl.dsp.workspace.toggle_special("scratch"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.move({ workspace = "special:scratch" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume control
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "bash -c \"wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+\"; paplay /usr/share/sounds/ocean/stereo/audio-volume-change.oga; notify-send -a \"Volume\" -t 1500 \"Volume\" \"$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | cut -d / -f 2)\" -p -r $(cat /tmp/volume-notif-id || echo -n 0) > /tmp/volume-notif-id"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-; paplay /usr/share/sounds/ocean/stereo/audio-volume-change.oga; notify-send -a \"Volume\" -t 1500 \"Volume\" \"$(pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | cut -d / -f 2)\" -p -r $(cat /tmp/volume-notif-id || echo -n 0) > /tmp/volume-notif-id"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })

-- Screen brightness (laptop)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media control
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Clipboard manager
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboardManager))

-- Zen mode
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("killall waybar -SIGUSR1"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-zen.sh"))

-- Multi-monitor
hl.bind(mainMod .. " + I", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.workspace.swap_monitors({ monitor1 = "eDP-1", monitor2 = "HDMI-A-1" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-1", monitor2 = "HDMI-A-1" }))

-- Calculator
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd("qalculate-qt"))

-- Screenshot with selection
hl.bind(mainMod .. " + S",
    hl.dsp.exec_cmd(
        "killall slurp || grim -g \"$(slurp)\" \"$HOME/Pictures/Snip_$(date +%Y%m%d_%Hh%Mm%Ss).png\" && wl-copy < \"$HOME/Pictures/Snip_$(date +%Y%m%d_%Hh%Mm%Ss).png\" && notify-send -t 3000 \"Screenshot taken and copied to clipboard\" -i \"$HOME/Pictures/$(ls ~/Pictures | grep Snip | sort | tail -n 1)\""))
-- More variants in Leader submap


-- Submaps!
-- Mimic Neovim's leader or Tmux's prefix key scheme to create keybind sequences

-- Leader key will be SUPER (pressed and released by itself)
hl.bind(mainMod .. " + SUPER_L", hl.dsp.submap("Leader"), { release = true, ignore_mods = true })

hl.define_submap("Leader", function()
    -- These first binds do not immediately exit the submap

    -- Move to the next *numerical* workspace
    hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "r+1" }), { repeating = true })
    hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = "r-1" }))

    -- These next binds first execute their function, then exit the submap

    -- Launch the application menu
    hl.bind("Space", function()
        hl.dispatch(hl.dsp.exec_cmd(menu))
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- Control menus
    hl.bind("Q", function()
        hl.dispatch(hl.dsp.exec_cmd(powerMenu))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    hl.bind("B", function()
        hl.dispatch(hl.dsp.exec_cmd(bluetoothMenu))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    hl.bind("W", function()
        hl.dispatch(hl.dsp.exec_cmd(wifiMenu))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    hl.bind("N", function()
        hl.dispatch(hl.dsp.exec_cmd("swaync-client -t -sw"))
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- Lock
    hl.bind("ALT + L", function()
        hl.dispatch(hl.dsp.exec_cmd("killall hyprlock; hyprlock"))
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- Center floating window
    hl.bind("C", function()
        hl.dispatch(hl.dsp.window.center())
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- Screenshots
    -- screen
    hl.bind("S",
        function()
            hl.dispatch(hl.dsp.exec_cmd(
                "grim \"$HOME/Pictures/Screenshot_$(date +%Y%m%d_%Hh%Mm%Ss).png\" && notify-send -t 3000 \"Screenshot taken\" -i \"$HOME/Pictures/$(ls ~/Pictures | grep Screenshot | sort | tail -n 1)\""))
            hl.dispatch(hl.dsp.submap("reset"))
        end)
    hl.bind("SHIFT + S",
        function()
            hl.dispatch(hl.dsp.exec_cmd(
                "grim -g \"$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1) $(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)\" \"$HOME/Pictures/Windowshot_$(date +%Y%m%d_%Hh%Mm%Ss).png\" && notify-send -t 3000 \"Screenshot of active window taken\" -i \"$HOME/Pictures/$(ls ~/Pictures | grep Windowshot | sort | tail -n 1)\""))
            hl.dispatch(hl.dsp.submap("reset"))
        end)

    -- Restart waybar
    hl.bind("ALT + W",
        function()
            hl.dispatch(hl.dsp.exec_cmd("killall waybar; ~/.config/hypr/scripts/waybar-dynamic-config.sh && waybar &!"))
            hl.dispatch(hl.dsp.submap("reset"))
        end)

    -- Reload all eww widgets
    hl.bind("ALT + E", function()
        hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/eww-open-all.sh"))
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- The flags make it possible to just tap SUPER again to reset the submap
    hl.bind("catchall", hl.dsp.submap("reset"), { release = true, ignore_mods = true })
end)
