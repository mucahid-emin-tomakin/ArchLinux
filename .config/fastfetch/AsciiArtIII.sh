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
    for file in $(ls ~/.config/fastfetch/AsciiArtIII/*.txt | sort -V); do
        clear
        paste <(cat "$file") <(fastfetch --config ~/.config/fastfetch/configIII.jsonc)  # Zeigt ASCII links und Fastfetch rechts
        sleep 0.01  # Wartezeit für Animationseffekt
    done
    clear
    fastfetch --config ~/.config/fastfetch/configII.jsonc
#
#
#