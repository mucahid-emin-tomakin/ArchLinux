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
    -- Misc settings
    hl.config({
        misc = {
            disable_watchdog_warning = true,
            disable_autoreload = true,
            disable_autoreload = false,
            disable_hyprland_logo = true,
            disable_splash_rendering = true,
            initial_workspace_tracking = 1,
            -- # vfr = true
            vrr = 2,
            mouse_move_enables_dpms = true,
            enable_swallow = true,
            -- swallow_regex = ^(kitty)$,
            focus_on_activate = false,
            middle_click_paste = false
        },
    })
--
--
--