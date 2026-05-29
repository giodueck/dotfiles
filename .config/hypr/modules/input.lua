---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout                   = "us",
        kb_variant                  = "",
        kb_model                    = "",

        -- This does:
        --   right alt (or alt gr) => compose key
        --   numpad always activated (no need for numlock)
        --   caps lock => ctrl
        kb_options                  = "compose:ralt, numpad:mac, ctrl:nocaps",
        kb_rules                    = "",
        repeat_delay                = 400,

        follow_mouse                = 2,
        float_switch_override_focus = 0,

        sensitivity                 = 0, -- -1.0 - 1.0, 0 means no modification.
        accel_profile               = "flat",

        touchpad                    = {
            natural_scroll = true,
            scroll_factor = 0.5,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "scroll_move"
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    -- Any receiver mouse technically, but in this case for the M575 Trackball
    name = "logitech-usb-receiver-mouse",
    sensitivity = -0.2,
    accel_profile = "adaptive",

    -- Set mouse 4 (back) to change the ball to scroll when held
    scroll_method = "on_button_down",
    scroll_button = 275,
})

