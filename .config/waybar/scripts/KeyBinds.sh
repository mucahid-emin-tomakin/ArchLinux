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
    # Keybinds – dynamische/automatische Hyprland-Tastenkürzel in rofi
    # Setup
    pkill rofi || true
    KEYBINDS="$HOME/.config/hypr/LUA/keybindings.lua"
    [[ -z "$KEYBINDS" || ! -f "$KEYBINDS" ]] && { rofi -e "Keine Keybinds gefunden"; exit 1; }
    # Dynamische Fensterbreite berechnen
    MON=$(hyprctl monitors | grep "at " | head -1 | awk '{print $1}' | cut -d'@' -f1 | cut -d'x' -f1)
    ROFI=$(( MON * 66 / 100 ))
    TARGET=$(( ROFI / 22 ))
    # Keybind-Datei einlesen (ohne Header/Footer)
    mapfile -t raw_lines < <(cat "$KEYBINDS" | tail -n +12 | head -n -3)
    # Zeilen parsen & formatieren
    for line in "${raw_lines[@]}"; do
        line=$(echo "$line" | sed 's/^[[:space:]]*//')
        # ---- Überschriften (--Zeilen) ----
        if [[ "$line" =~ ^-- && "$line" != "--" ]]; then
            clean=$(echo "$line" | sed 's/^--[[:space:]]*//')
            pad=$(( TARGET - (${#clean} / 2) ))
            printf "%${pad}s<span bgcolor='#2CFF05' color='#2323FF'>%s</span>\n" "" "$clean"
        # ---- Keybinds (hl.bind) ----
        elif [[ "$line" == *"hl.bind"* ]]; then
            keys=$(echo "$line" | sed 's/.*bind("//; s/",.*//')
            desc=$(echo "$line" | sed 's/.*--[[:space:]]*//')
            keys=$(echo "$keys" | sed 's/\.\. " + " \.\./+/g; s/"//g')
            if [[ -n "$desc" && "$desc" != "$line" ]]; then
                pad=$((TARGET - ${#keys}))
                printf "%${pad}s%s → %s\n" "" "$keys" "$desc"
            else
                echo "$keys"
            fi
        # ---- Sonstige Zeilen (Variablen etc.) ----
        elif [[ -n "$line" && "$line" != "--" ]]; then
            clean=$(echo "$line" | sed 's/^local //; s/"//g')
            pad=$(( TARGET - (${#clean} / 2) ))
            printf "%${pad}s%s\n" "" "$clean"
        fi
    # Rofi-Ausgabe
    done | rofi -dmenu -i -markup-rows -p "" \
        -theme-str 'entry {enabled: false;}' \
        -theme-str 'mainbox {children: [listview]; padding: 1px;}' \
        -theme-str 'listview {lines: 33%; spacing: 1px; cycle: true;}' \
        -theme-str 'element-text {horizontal-align: 0.0;}' \
        -theme-str 'element selected {background-color: #2CFF05; text-color: #2323FF;}' \
        -theme-str 'window {height: 75%; width: 66%; location: center; anchor: center;}'
#
#
#