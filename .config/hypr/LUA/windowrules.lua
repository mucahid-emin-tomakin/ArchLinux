--
--
--
-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ 
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
-- ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 
--
    ---@module 'hl'
    -- Browser Picture in Picture
    hl.window_rule({
        name = "float",
        match = { title = "^(Picture-in-Picture)$" },
        float = true
    })
    hl.window_rule({
        name = "pin",
        match = { title = "^(Picture-in-Picture)$" },
        pin = true
    })
    hl.window_rule({
        name = "move",
        match = { title = "^(Picture-in-Picture)$" },
        move = { 0.695, 0.04 }
    })
    -- pulsemixer als Float-Fenster
    hl.window_rule({
        name = "pulsemixer_float",
        match = { class = "pulsemixer" },
        float = true,
        size = { 1222, 444 },
        move = { 320, 320 },
    })
    -- blueman-manager
    hl.window_rule({
        name  = "blueman-manager",
        match = {
        class = "^blueman-manager$",
        },
        size    = "500 500",
        float   = true,
        center  = true,
        opacity = "0.9 0.7"
    })
--
--
--