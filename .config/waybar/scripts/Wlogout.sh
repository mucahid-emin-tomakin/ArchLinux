# !/bin/bash
#
#
# ██╗    ██╗ █████╗ ██╗   ██╗██████╗  █████╗ ██████╗ 
# ██║    ██║██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
# ██║ █╗ ██║███████║ ╚████╔╝ ██████╔╝███████║██████╔╝
# ██║███╗██║██╔══██║  ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
# ╚███╔███╔╝██║  ██║   ██║   ██████╔╝██║  ██║██║  ██║
#  ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
#
	# Wlogout.sh – Power-Menü mit rofi
	choice=$(echo -e "Herunterfahren\nNeustart\nAbmelden\nAbbrechen" | rofi -dmenu -p "" \
	    -theme-str 'entry {enabled: false;}' \
	    -theme-str 'mainbox {children: [listview]; padding: 33px;}' \
	    -theme-str 'listview {lines: 4; spacing: 12px; cycle: false;}' \
	    -theme-str 'element {padding: 14px 8px;}' \
	    -theme-str 'element-text {horizontal-align: 0.5;}' \
	    -theme-str 'window {width: 44%; location: center; anchor: center;}')
	case "$choice" in
	    "Herunterfahren")
	        systemctl poweroff
	        ;;
	    "Neustart")
	        systemctl reboot
	        ;;
	    "Abmelden")
	        hyprctl dispatch exit
	        ;;
	esac
#
#
#