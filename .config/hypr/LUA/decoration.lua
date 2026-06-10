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
    -- General window decoration
    hl.config({
        decoration = {
            rounding = 11,
            active_opacity = 1.0,
            inactive_opacity = 0.3,
            fullscreen_opacity = 1.0,
            shadow = {
              enabled      = true,
              range        = 4,
              render_power = 3,
              color        = 0xee1a1a1a,
            },
            blur = {
                enabled = true,
                size = 11,
                passes = 1,
                new_optimizations = true,
                ignore_opacity = true,
                xray = true
            }
        },
        animations = {
            enabled = true,
        }
    })
--
--
--