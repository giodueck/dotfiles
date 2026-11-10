-- Scratchpad: when this workspace is created, open a floating terminal window
hl.on("workspace.created", function(ws)
    if ws.name == "special:scratch" and ws.is_empty then
        hl.dispatch(hl.dsp.exec_cmd(terminal,
            { float = true, size = { hl.get_active_monitor().width * 0.5, hl.get_active_monitor().height * 0.6 }, center = true }))
    end
end)
