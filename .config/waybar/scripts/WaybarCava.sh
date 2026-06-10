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
WallC0="#FF0000"
WallC1="#FF8000"
WallC2="#FFFF00"
WallC3="#00FF00"
WallC4="#00FFFF"
WallC5="#0000FF"
WallC6="#8000FF"
WallFG="#FF00FF"
    #----- Optimized bars animation without much CPU usage increase --------
    bar="▁▂▃▄▅▆▇█"
    colors=("$WallC0" "$WallC1" "$WallC2" "$WallC3" "$WallC4" "$WallC5" "$WallC6" "$WallFG")
    #colors=("#FF0000" "#FF8000" "#FFFF00" "#00FF00" "#00FFFF" "#0000FF" "#8000FF" "#FF00FF")
    config_file="/tmp/bar_cava_config"
    # Cava-Config schreiben
cat > "$config_file" <<-EOF
[general]
bars = 10
[input]
method = pipewire
source = auto
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF
    # Vorherige cava-Instanz beenden
    pkill -f "cava -p $config_file"
    # Cava starten & Werte umwandeln
    cava -p "$config_file" | while read -r line; do
        IFS=';' read -ra values <<< "$line"  # Werte als Array speichern
        output=""
        for i in "${!values[@]}"; do
            index=${values[i]}
            [[ "$index" =~ ^[0-7]$ ]] || continue  # Sicherstellen, dass es Zahlen sind
            color="${colors[i % ${#colors[@]}]}"   # Farbe wechseln
            output+="<span color=\"$color\">${bar:$index:1}</span>"
        done
        echo $output
    done
#
#
#