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
    -- General window layout and colors
    hl.config({
        general = {
            layout = "dwindle",
            resize_on_border = true,
            allow_tearing = true,
            extend_border_grab_area = 22,
            gaps_in = 1,
            gaps_out = 1,
            border_size = 3,
            col = {
                active_border = {
                    colors = {
                        "rgb(FF0000)",
                        "rgb(FFFF00)",
                        "rgb(00FF00)",
                        "rgb(00FFFF)",
                        "rgb(0000FF)",
                        "rgb(FF00FF)",
                        angle = 45 
                    }
                },
                inactive_border = "rgba(22222288)"
            },
        }
    })
    -- 🌈 Rainbow Border Animation (alle 0.5s neue Zufallsfarben)
    hl.timer(function()
        local c1 = string.format("rgb(%02X%02X%02X)", math.random(0,255), math.random(0,255), math.random(0,255))
        local c2 = string.format("rgb(%02X%02X%02X)", math.random(0,255), math.random(0,255), math.random(0,255))
        local c3 = string.format("rgb(%02X%02X%02X)", math.random(0,255), math.random(0,255), math.random(0,255))
        local c4 = string.format("rgb(%02X%02X%02X)", math.random(0,255), math.random(0,255), math.random(0,255))
        local c5 = string.format("rgb(%02X%02X%02X)", math.random(0,255), math.random(0,255), math.random(0,255))
        local c6 = string.format("rgb(%02X%02X%02X)", math.random(0,255), math.random(0,255), math.random(0,255))
        hl.config({
            general = {
                col = {
                    active_border = {
                        colors = {c1, c2, c3, c4, c5, c6}
                    }
                }
            }
        })
    end, {timeout = 500, type = "repeat"})
--
--
--