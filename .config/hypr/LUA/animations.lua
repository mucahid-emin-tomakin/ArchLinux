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
    -- Benutzerdefinierte Kurven definieren
    hl.curve("easeOut", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })
    hl.curve("wind", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
    hl.curve("winIn", { type = "bezier", points = { {0.1, 1.1}, {0.1, 1.1} } })
    hl.curve("winOut", { type = "bezier", points = { {0.3, -0.3}, {0, 1} } })
    hl.curve("liner", { type = "bezier", points = { {1, 1}, {1, 1} } })
    -- Animationen für verschiedene Aktionen
    hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "default" })
    hl.animation({ leaf = "windows", enabled = true, speed = 0.2, bezier = "easeOut" })
    hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, bezier = "winIn", style = "slide" })
    hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "winOut", style = "slide" })
    hl.animation({ leaf = "windowsMove", enabled = true, speed = 1, bezier = "wind", style = "slide" })
    hl.animation({ leaf = "workspaces", enabled = true, speed = 0.2, bezier = "easeOut" })
    hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
    hl.animation({ leaf = "borderangle", enabled = true, speed = 33, bezier = "liner", style = "loop" })
    hl.animation({ leaf = "fade", enabled = true, speed = 0.1, bezier = "easeOut" })
--
--
--