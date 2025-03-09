#
#
#
#    ,---,                                      ____                ___
#   '  .' \                    ,--,           ,'  , `.            ,--.'|_    ,--,
#  /  ;    '.          ,---, ,--.'|        ,-+-,.' _ |            |  | :,' ,--.'|    ,---.        ,---,
# :  :       \     ,-+-. /  ||  |,      ,-+-. ;   , ||            :  : ' : |  |,    '   ,'\   ,-+-. /  |
# :  |   /\   \   ,--.'|'   |`--'_     ,--.'|'   |  || ,--.--.  .;__,'  /  `--'_   /   /   | ,--.'|'   |
# |  :  ' ;.   : |   |  ,"' |,' ,'|   |   |  ,', |  |,/       \ |  |   |   ,' ,'| .   ; ,. :|   |  ,"' |
# |  |  ;/  \   \|   | /  | |'  | |   |   | /  | |--'.--.  .-. |:__,'| :   '  | | '   | |: :|   | /  | |
# '  :  | \  \ ,'|   | |  | ||  | :   |   : |  | ,    \__\/: . .  '  : |__ |  | : '   | .; :|   | |  | |
# |  |  '  '--'  |   | |  |/ '  : |__ |   : |  |/     ," .--.; |  |  | '.'|'  : |_|   :    ||   | |  |/
# |  :  :        |   | |--'  |  | '.'||   | |`-'     /  /  ,.  |  ;  :    ;|  | '.'\   \  / |   | |--'
# |  | ,'        |   |/      ;  :    ;|   ;/        ;  :   .'   \ |  ,   / ;  :    ;`----'  |   |/
# `--''          '---'       |  ,   / '---'         |  ,     .-./  ---`-'  |  ,   /         '---'
#                             ---`-'                 `--`---'               ---`-'                                                                                                     
#
#!/bin/bash
#o
    #while true; do
        for file in $(ls /home/tomaking/.config/fastfetch/AnimeEdit/*.txt | sort -V); do
            clear
            paste <(cat "$file")  # Zeigt ASCII links und Fastfetch rechts
            sleep 0.01  # Wartezeit für Animationseffekt
        done
        clear
        fastfetch
    #done
#
    # Öffne Kitty mit 2 Splits
    #kitty --detach sh -c "
        #while true; do
            #for frame in /home/tomaking/.config/fastfetch/naruto/*.txt; do
                #clear
                #cat \"$frame\"
                #sleep 0.1
            #done
        #done
    #" &
    # Fastfetch im anderen Split starten
    #kitty --detach fastfetch
#
    # Erstellt eine horizontale Split-Ansicht
    #kitty @ launch --type=window --cwd=current --location=hsplit bash -c 'kitty +kitten icat /home/tomaking/.config/fastfetch/ottoman.gif; read'
    # Startet fastfetch in der rechten Hälfte
    #kitty @ launch --type=window --cwd=current bash -c 'fastfetch; read'
#
    # Terminal leeren
    #clear
    # Terminal-Breite und -Höhe abrufen
    #cols=$(tput cols)  # Spaltenanzahl
    #rows=$(tput lines) # Zeilenanzahl
    # Definiere die Position, wo Fastfetch beginnen soll (Mitte des Bildschirms)
    #fastfetch_x=$((cols / 2))  # Startet auf der rechten Hälfte
    # GIF anzeigen (links)
    #kitty +kitten icat --align left --scale-up /home/tomaking/.config/fastfetch/ottoman.gif &
    # Warte kurz, damit das Bild gerendert wird
    #sleep 1
    # Cursor auf die rechte Seite setzen und Fastfetch ausführen
    #tput cup 0 $fastfetch_x
    #fastfetch
#
    # Teile das Terminal horizontal
    #kitty @ split --horizontal --clear
    # Starte das GIF im linken Bereich
    #kitty @ launch --type=window bash -c "kitty +kitten icat --align left /home/tomaking/.config/fastfetch/ottoman.gif; exec bash" &
    # Starte Fastfetch im rechten Bereich
    #kitty @ launch --type=window bash -c "fastfetch; exec bash"
#
    # Kitty Terminal in zwei Fenster teilen (horizontal)
    #kitty @ launch --type=os-window --cwd="$PWD" &
    #sleep 0.5  # Warten, bis das Fenster startet
    # Linke Seite: GIF anzeigen (ohne sichtbare Trennlinie)
    #kitty @ launch --type=overlay bash -c 'kitty +kitten icat --align left /home/tomaking/.config/fastfetch/ottoman.gif --loop' &
    #sleep 0.5
    # Rechte Seite: Fastfetch anzeigen
    #kitty @ launch bash -c 'fastfetch; read -p "Drücke Enter um fortzufahren..."' &
    # Wartezeit, dann zurück zum normalen Terminal
    #sleep 5  # Ändere dies, um die Anzeigezeit zu steuern
    # Alles schließen und zurück zu einem einzigen Terminal
    #kitty @ close-window --self
#
    # Terminal leeren
    #clear
    # GIF auf der linken Seite anzeigen (ohne --loop, da icat GIFs automatisch looped)
    #kitty +kitten icat --align left /home/tomaking/.config/fastfetch/ottoman.gif &
    # Fastfetch rechts anzeigen und rechtsbündig formatieren
    #fastfetch | awk '{printf "%-50s\n", $0}'
    # Nach ein paar Sekunden Terminal wieder normal machen
    #sleep 5
    #clear
#
    #while true; do
        #for file in /home/tomaking/.config/fastfetch/naruto/*.txt; do
            #clear
            #cat "$file" | awk '{printf "%-40s\n", $0}'  # ASCII links
            #fastfetch | awk '{printf "%40s\n", $0}'  # Fastfetch rechts
            #sleep 0.5
        #done
    #done
#
    #while true; do
        #for file in /home/tomaking/.config/fastfetch/naruto/*.txt; do
            #clear
            #paste <(cat "$file") <(fastfetch)  # Zeigt ASCII links und Fastfetch rechts
            #sleep 0.033  # Wartezeit für Animationseffekt
        #done
    #done
#
    #while true; do
        #for file in /home/tomaking/.config/fastfetch/naruto/*.txt; do
            #tput cup 0 0  # Setzt den Cursor oben links hin
            #cat "$file" | awk '{printf "%-33s\n", $0}'  # ASCII links
            #fastfetch | awk '{printf "%33s\n", $0}'  # Fastfetch rechts
            #sleep 0.05
        #done
    #done
#
    # Splitte das Terminal horizontal
    #kitty @ launch --type=window --title="GIF" bash -c "kitty +kitten icat --align left /home/tomaking/.config/fastfetch/ottoman.gif; exec bash"
    # Starte Fastfetch im zweiten Fenster
    #kitty @ launch --type=window --title="Fastfetch" bash -c "fastfetch; exec bash"
#
    #kitty @ split-window --horizontal
    #kitty @ launch --type=window --no-focus kitty +kitten icat --align left ottoman.gif &
    #kitty @ focus-window 1
    #kitty @ set-spacing 0
    #fastfetch
#
#
#