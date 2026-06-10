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
	-- SUPER KEY
	local mainMod = "SUPER"
	-- Session Manager
	hl.bind("SUPER" .. " + " .. "ALT" .. " + " .. "S", hl.dsp.exec_cmd("~/.config/systemd/user/SessionManager.sh --save"))  	-- Save Session
	hl.bind("SUPER" .. " + " .. "ALT" .. " + " .. "R", hl.dsp.exec_cmd("~/.config/systemd/user/SessionManager.sh --restore")) 	-- Restore Session
	-- WallpaperEffects
	hl.bind("SUPER" .. " + " .. "ALT" .. " + " .. "W", hl.dsp.exec_cmd("~/.config/waybar/scripts/WallpaperEffects.sh"))			-- Set WallpaperEffects
	-- Hyprlock
	hl.bind("SUPER" .. " + " .. "L", hl.dsp.exec_cmd("bash -c '~/.config/waybar/scripts/HyprlockBG.sh && hyprlock'"))			-- Set Hyprlock Background and Lock the sreen
	-- Hyprland
	hl.bind("SUPER" .. " + " .. "SHIFT" .. " + " .. "E", hl.dsp.exec_cmd("hyprctl dispatch exit"))								-- End Hyprland (back to TTY)
	hl.bind("SUPER" .. " + " .. "SHIFT" .. " + " .. "R", hl.dsp.exec_cmd("hyprctl reload"))  									-- Reload Hyprland configuration
	-- Windows
	hl.bind("SUPER" .. " + " .. "F", hl.dsp.window.fullscreen())  																-- Set active window to fullscreen
	hl.bind("SUPER" .. " + " .. "M", hl.dsp.window.fullscreen())																-- Maximize Window
	hl.bind("SUPER" .. " + " .. "T", hl.dsp.window.float())																		-- Toggle active windows into floating mode
	hl.bind("SUPER" .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })											-- Move window with the mouse
	hl.bind("SUPER" .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })  										-- Resize window with the mouse
	-- Application
	hl.bind("ALT" .. " + " .. "F4", hl.dsp.window.close())  																	-- Kill active window
	hl.bind("SUPER" .. " + " .. "SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -modi \"recursivebrowser,drun,run,window,filebrowser\" -replace -i"), { repeating = true })  	-- Open application launcher
	hl.bind("SUPER" .. " + " .. "RETURN", hl.dsp.exec_cmd("kitty -e ~/.config/fastfetch/QuickFastfetch.sh"))					-- Start Kitty without fastfetch animation
	hl.bind("SUPER" .. " + " .. "Q", hl.dsp.exec_cmd("kitty"))																	-- Start Kitty with fastfetch animation
	-- Mouse
	hl.bind("SUPER+ALT" .. " + " .. "mouse_down", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(awk BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print local_var_2}') + 0.5} )"))  	-- Zoom in
	hl.bind("SUPER+ALT" .. " + " .. "mouse_up", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(awk BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print local_var_2}') - 0.5} )"))  	-- Zoom out
	-- Workspaces
	hl.bind("SUPER" .. " + " .. "A", hl.dsp.focus({ workspace = "+1" }))  														-- Open new workspace
	hl.bind("SUPER" .. " + " .. "SHIFT" .. " + " .. "A", hl.dsp.focus({ workspace = -1 }))										-- Closes new workspace
	hl.bind("SUPER" .. " + " .. "Tab", hl.dsp.focus({ workspace = "m+1" }))														-- Open next workspace
	hl.bind("SUPER" .. " + " .. "SHIFT" .. " + " .. "Tab", hl.dsp.focus({ workspace = "m-1" }))									-- Open previous workspace
	hl.bind("ALT" .. " + " .. "Tab", hl.dsp.focus({ window = "+1" }))															-- Fokus auf nächste Anwendung
	hl.bind("ALT + SHIFT" .. " + " .. "Tab", hl.dsp.focus({ window = -1 }))														-- Fokus auf vorhärige Anwendung
	hl.bind("SUPER" .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))												-- Open next workspace
	hl.bind("SUPER" .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))												-- Open previous workspace
	hl.bind("SUPER" .. " + " .. "CTRL" .. " + " .. "down", hl.dsp.focus({ workspace = "empty" }))								-- Open the next empty workspace
	-- Fn keys
	hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q s +10%"))													-- Increase brightness by 10%
	hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q s 10%-"))												-- Reduce brightness by 10%
	hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))								-- Increase volume by 5%
	hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))								-- Reduce volume by 5%
	hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))										-- Toggle mute
	hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))															-- Audio play pause
	hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"))																-- Audio pause
	hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))																	-- Audio next
	hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))																-- Audio previous
	hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))								-- Toggle microphone
--
--
--