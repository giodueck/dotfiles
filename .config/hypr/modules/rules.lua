--------------------
---- WORKSPACES ----
--------------------

-- Scratchpad
hl.workspace_rule({
    workspace = "special:scratch",
    on_created_empty = "[float; size (monitor_w*0.5) (monitor_h*0.6); center] " .. terminal,
})

-----------------
---- WINDOWS ----
-----------------

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Make calculator float off to one side
hl.window_rule({
    name = "calculator-float",
    match = {
        class = "^io.github.Qalculate.qalculate-qt$",
    },
    float = true,
    size = { "(monitor_w*0.3)", "(monitor_h*0.8)" },
    move = { "(monitor_w*0.6)", "(monitor_h*0.05)" },
})
