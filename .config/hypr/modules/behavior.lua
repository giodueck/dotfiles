------------------
---- BEHAVIOR ----
------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        allow_session_lock_restore = true,
        mouse_move_enables_dpms = true,
        focus_on_activate = true,

        -- Application not responding dialog
        enable_anr_dialog = true,
        anr_missed_pings = 5,
    },

    binds = {
        workspace_back_and_forth = true,
        hide_special_on_workspace_change = true,
    },

    cursor = {
        no_warps = true,
    },
})
