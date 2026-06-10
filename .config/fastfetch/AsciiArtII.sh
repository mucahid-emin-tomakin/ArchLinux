#!/bin/bash
#
#
# ███████╗ █████╗ ███████╗████████╗███████╗███████╗████████╗ ██████╗██╗  ██╗
# ██╔════╝██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝██║  ██║
# █████╗  ███████║███████╗   ██║   █████╗  █████╗     ██║   ██║     ███████║
# ██╔══╝  ██╔══██║╚════██║   ██║   ██╔══╝  ██╔══╝     ██║   ██║     ██╔══██║
# ██║     ██║  ██║███████║   ██║   ██║     ███████╗   ██║   ╚██████╗██║  ██║
# ╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚══════╝   ╚═╝    ╚═════╝╚═╝  ╚═╝
#
    for file in $(ls ~/.config/fastfetch/AsciiArtII/*.txt | sort -V); do
        clear
        paste <(cat "$file")  # Zeigt ASCII links und Fastfetch rechts
        sleep 0.01  # Wartezeit für Animationseffekt
    done
    clear
    fastfetch --config ~/.config/fastfetch/configII.jsonc
#
#
#