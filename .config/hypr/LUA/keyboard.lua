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
    -- Keyboard Layout
    hl.config({
        input = {
            kb_layout = "de",
            kb_variant = "",
            kb_model = "",
            kb_options = "",
            numlock_by_default = true,
            left_handed = false,
            follow_mouse = 1,
            float_switch_override_focus = false,
            mouse_refocus = false,
            touchpad = {
                natural_scroll = false,
                scroll_factor = 1.0,
                -- Touchpad scroll factor
            },
            sensitivity = 0,
            -- Pointer speed: -1.0 - 1.0, 0 means no modification.
        },
    })
--
--
--