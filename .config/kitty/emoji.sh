#
#
#
# ██╗  ██╗██╗████████╗████████╗██╗   ██╗
# ██║ ██╔╝██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝
# █████╔╝ ██║   ██║      ██║    ╚████╔╝
# ██╔═██╗ ██║   ██║      ██║     ╚██╔╝
# ██║  ██╗██║   ██║      ██║      ██║
# ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝
#
#!/bin/bash
#
    # Array mit Emojis
    emojis=("😀" "😎" "🤖" "🦄" "🎉" "🚀" "🍕" "🌈" "🐱" "🧑‍💻")
#
    # Zufälliges Emoji auswählen
    random_emoji=${emojis[$RANDOM % ${#emojis[@]}]}
#
    # Aktuellen Pfad und Dateiname abrufen
    current_path=$(pwd) # Gibt den aktuellen Arbeitsverzeichnis-Pfad aus
    current_file="${1:-}" # Falls ein Dateiname übergeben wird, verwenden
#
    # Falls eine Datei übergeben wurde, nur den Dateinamen extrahieren
    if [[ -n "$current_file" ]]; then
        filename=$(basename "$current_file")
        tab_title="$random_emoji $current_path/$filename"
    else
        tab_title="$random_emoji $current_path"
    fi
#
    # Kitty Tab-Titel setzen
    kitty @ set-tab-title "$tab_title"
#
#
#