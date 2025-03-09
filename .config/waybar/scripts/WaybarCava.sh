#
#
#
#            .---.                                                       ,----..
#           /. ./|                        ,---,                         /   /   \
#       .--'.  ' ;                      ,---.'|                 __  ,-.|   :     :
#      /__./ \ : |                      |   | :               ,' ,'/ /|.   |  ;. /               .---.
#  .--'.  '   \' .  ,--.--.        .--, :   : :      ,--.--.  '  | |' |.   ; /--`   ,--.--.    /.  ./|   ,--.--.
# /___/ \ |    ' ' /       \     /_ ./| :     |,-.  /       \ |  |   ,';   | ;     /       \ .-' . ' |  /       \
# ;   \  \;      :.--.  .-. | , ' , ' : |   : '  | .--.  .-. |'  :  /  |   : |    .--.  .-. /___/ \: | .--.  .-. |
#  \   ;  `      | \__\/: . ./___/ \: | |   |  / :  \__\/: . .|  | '   .   | '___  \__\/: . .   \  ' .  \__\/: . .
#   .   \    .\  ; ," .--.; | .  \  ' | '   : |: |  ," .--.; |;  : |   '   ; : .'| ," .--.; |\   \   '  ," .--.; |
#    \   \   ' \ |/  /  ,.  |  \  ;   : |   | '/ : /  /  ,.  ||  , ;   '   | '/  :/  /  ,.  | \   \    /  /  ,.  |
#     :   '  |--";  :   .'   \  \  \  ; |   :    |;  :   .'   \---'    |   :    /;  :   .'   \ \   \ |;  :   .'   \
#      \   \ ;   |  ,     .-./   :  \  \/    \  / |  ,     .-./         \   \ .' |  ,     .-./  '---" |  ,     .-./
#       '---"     `--`---'        \  ' ;`-'----'   `--`---'              `---`    `--`---'             `--`---'
#
#!/bin/bash
#----- Optimized bars animation without much CPU usage increase --------
bar="▁▂▃▄▅▆▇█"
colors=("#FF0000" "#FF8000" "#FFFF00" "#00FF00" "#00FFFF" "#0000FF" "#8000FF" "#FF00FF")
config_file="/tmp/bar_cava_config"

# Cava-Config schreiben
cat >"$config_file" <<EOF
[general]
bars = 10

[input]
method = pulse
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