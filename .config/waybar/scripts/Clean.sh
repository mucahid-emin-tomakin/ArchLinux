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
	# Clean.sh – System-Bereinigung
	echo "🧹 Räume auf..."
	# Verwaiste Pakete entfernen
	echo "→ Verwaiste Pakete (pacman)..."
	sudo pacman -Rns $(pacman -Qdtq) --noconfirm 2>/dev/null || echo "  keine gefunden"
	# Paket-Cache leeren
	echo "→ Paket-Cache leeren..."
	sudo pacman -Scc --noconfirm
	# Alte Logs löschen (älter als 7 Tage)
	echo "→ Journal-Logs bereinigen..."
	sudo journalctl --vacuum-time=7d
	# AUR verwaiste Pakete (nur wenn yay installiert)
	if command -v yay &>/dev/null; then
	    echo "→ Verwaiste AUR-Pakete..."
	    yay -Rns $(yay -Qdtq) --noconfirm 2>/dev/null || echo "  keine gefunden"
	fi
	echo "✅ Fertig!"
#
#
#