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
	-- NVIDIA https://wiki.hyprland.org/Nvidia/
	-- check this post https://github.com/elFarto/nvidia-vaapi-driver#configuraton
	hl.env("HYPRLAND_NO_TILE", 1)  					-- Deaktiviert automatisches Tiling
	hl.env("HYPRLAND_NO_SD_NOTIFY", 1)  			-- Deaktiviert Meldung
	hl.env("SDL_VIDEODRIVER", "wayland")			--Setzt Wayland als Standard für SDL (Simple DirectMedia Layer)
	hl.env("EGL_PLATFORM", "wayland")				--Setzt Wayland als Standard für EGL (OpenGL-Unterbau)
	hl.env("LIBVA_DRIVER_NAME", "nvidia")			--Setzt NVIDIA als Treiber für Video-Hardwarebeschleunigung (VA-API)
	hl.env("GBM_BACKEND", "nvidia-drm")				--Setzt NVIDIA-GBM als Backend für die Grafikausgabe
	hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")	--Setzt NVIDIA als bevorzugten Vulkan-Renderer
	hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")	--Weist GLX an, die NVIDIA-OpenGL-Bibliotheken zu nutzen
	hl.env("__GL_GSYNC_ALLOWED", 1)					--Erlaubt G-Sync für flüssige Bewegungen
	hl.env("__GL_VRR_ALLOWED", 1)					--Aktiviert Variable Refresh Rate (VRR, z. B. G-Sync, FreeSync) für weniger Stuttering
	hl.env("__NV_PRIME_RENDER_OFFLOAD", 1)			--Ermöglicht NVIDIA Prime Render Offload (GPU-Umschaltung)
	hl.env("HYPRCURSOR_THEME","Bibata-Modern-Ice")	-- Bibata-Modern-Ice-Cursor
	hl.env("HYPRCURSOR_SIZE","24")					-- Cursor size
	--hl.env("WLR_NO_HARDWARE_CURSORS", 1)			--Fix für Flickering-Probleme mit Hardware-Cursor
	--hl.env("WLR_RENDERER_ALLOW_SOFTWARE", 1)		--Erlaubt Software-Rendering, falls keine GPU verfügbar ist
--
--
--