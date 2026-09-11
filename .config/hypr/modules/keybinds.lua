local helpers = require('modules.helpers')
local printTable = helpers.printTable

------------------
---- KEYBINDS ----
------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

local function kill_or_minimize(window)
    if window.class == "Steam" then
        hl.dispatch(hl.dsp.exec_cmd("xdotool getactivewindow windowunmap"))
    else
        hl.dispatch(hl.dsp.window.close({ window = window }))
    end
end

-- Close window
hl.bind(mainMod .. " + Q", function() kill_or_minimize(hl.get_active_window()) end)

-- Close all windows in the current workspace
hl.bind(mainMod .. " + SHIFT + Q", function()
    local windows = hl.get_workspace_windows(hl.get_active_workspace())

    for _, value in pairs(windows) do
        kill_or_minimize(value)
    end
end)

-- Exit Hyprland
hl.bind(mainMod .. " + Delete", hl.dsp.exit())

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(terminalAlt))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
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
hl.bind(mainMod .. " + CTRL + H", function()
    hl.dispatch(hl.dsp.window.cycle_next({ next = true }))
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(mainMod .. " + CTRL + L", function ()
    hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Move to previous/next workspace with mainMod + JK
hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = "m-1" }))

-- Cycle windows
hl.bind("ALT + TAB", function ()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Switch to workspaces 1-5 with mainMod + ASDFG
hl.bind(mainMod .. " + A", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + D", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + F", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + G", hl.dsp.focus({ workspace = 5 }))

-- Move window
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + H", function ()
    hl.dispatch(hl.dsp.layout("expel"))
    hl.dispatch(hl.dsp.layout("swapcol l"))
end)
hl.bind(mainMod .. " + SHIFT + L", function ()
    hl.dispatch(hl.dsp.layout("expel"))
    hl.dispatch(hl.dsp.layout("swapcol r"))
end)

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
hl.bind(mainMod .. " + Z", function()
    local zen_mode = (hl.get_config("animations.enabled") == false)

    if zen_mode then
        hl.exec_cmd("hyprctl reload")
        return
    end

    hl.config({
        general = {
            border_size = 0,
            gaps_in = 0,
            gaps_out = 0,
        },
        animations = { enabled = false },
        decoration = {
            rounding = 0,
            inactive_opacity = 1
        },
    })
end)

-- Multi-monitor
hl.bind(mainMod .. " + I", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.workspace.swap_monitors({ monitor1 = "eDP-1", monitor2 = "HDMI-A-1" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-1", monitor2 = "HDMI-A-1" }))

-- Calculator
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd("qalculate-qt"))


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

    -- Toggle tiled and fullscreen
    hl.bind("F", function()
        hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    hl.bind("SHIFT + F", function()
        hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" }))
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- Toggle current window between full column width and half
    hl.bind("Z", function()
        local layout = hl.get_active_window().layout
        if (layout ~= nil and layout.column.width == 1.0) then
            hl.dispatch(hl.dsp.layout("colresize 0.5"))
            -- this is so an empty space won't be left of the right of a window
            -- (if the active window is the right-most window)
            hl.dispatch(hl.dsp.layout("focus left"))
            hl.dispatch(hl.dsp.layout("focus right"))
        else
            hl.dispatch(hl.dsp.layout("colresize 1.0"))
        end
        hl.dispatch(hl.dsp.submap("reset"))
    end)

    -- Screenshots
    -- Selection
    hl.bind("S",
        function()
            hl.dispatch(hl.dsp.exec_cmd(
                "killall slurp || grim -g \"$(slurp)\" \"$HOME/Pictures/Snip_$(date +%Y%m%d_%Hh%Mm%Ss).png\" && wl-copy < \"$HOME/Pictures/Snip_$(date +%Y%m%d_%Hh%Mm%Ss).png\" && notify-send -t 3000 \"Screenshot taken and copied to clipboard\" -i \"$HOME/Pictures/$(ls ~/Pictures | grep Snip | sort | tail -n 1)\""))
            hl.dispatch(hl.dsp.submap("reset"))
        end)
    -- Screen
    hl.bind("SHIFT + S",
        function()
            hl.dispatch(hl.dsp.exec_cmd(
                "grim \"$HOME/Pictures/Screenshot_$(date +%Y%m%d_%Hh%Mm%Ss).png\" && notify-send -t 3000 \"Screenshot taken\" -i \"$HOME/Pictures/$(ls ~/Pictures | grep Screenshot | sort | tail -n 1)\""))
            hl.dispatch(hl.dsp.submap("reset"))
        end)
    -- Active window
    hl.bind("CTRL + S",
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
