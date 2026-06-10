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
	-- Layouts
	hl.config({
	  master = {
	    new_status = "master",
	    new_on_top = 1,
	    mfact = 0.5,
	  },
	})
	hl.gesture({
	  fingers = 3,
	  direction = "horizontal",
	  action = "workspace",
	  -- distance = 500, -- try this is workspace_swipe_... don't work
	  workspace_swipe_distance = 500,
	  workspace_swipe_invert = true,
	  workspace_swipe_min_speed_to_force = 30,
	  workspace_swipe_cancel_ratio = 0.5,
	  workspace_swipe_create_new = true,
	  workspace_swipe_forever = true
	})
	hl.config({
	  render = {
	    -- # explicit_sync = 2
	    -- # explicit_sync_kms = 2
	    direct_scanout = false
	  },
	  binds = {
	    workspace_back_and_forth = false,
	    allow_workspace_cycles = true,
	    pass_mouse_when_bound = false,
	  },
	  -- IMPORTANT: prevent pixelating when scaling
	  xwayland = {
	    enabled = true,
	    force_zero_scaling = true
	  },
	  opengl = {
	    nvidia_anti_flicker = true
	  },
	})
--
--
--