#
#
#
#   ,----..    ,--,
#  /   /   \ ,--.'|
# |   :     :|  | :                                ,---,
# .   |  ;. /:  : '                            ,-+-. /  |
# .   ; /--` |  ' |      ,---.     ,--.--.    ,--.'|'   |
# ;   | ;    '  | |     /     \   /       \  |   |  ,"' |
# |   : |    |  | :    /    /  | .--.  .-. | |   | /  | |
# .   | '___ '  : |__ .    ' / |  \__\/: . . |   | |  | |
# '   ; : .'||  | '.'|'   ;   /|  ," .--.; | |   | |  |/
# '   | '/  :;  :    ;'   |  / | /  /  ,.  | |   | |--'
# |   :    / |  ,   / |   :    |;  :   .'   \|   |/
#  \   \ .'   ---`-'   \   \  / |  ,     .-./'---'
#   `---`               `----'   `--`---'
#
# .config/waybar/scripts/Clean.sh
#
	sudo pacman -Rns $(pacman -Qdtq)
	#pacman -Qdtq: Listet alle verwaisten Pakete auf.
	#Rns: Entfernt Pakete und alle nicht mehr benötigten Abhängigkeiten.
	sudo pacman -Rns $(pacman -Qdt)
	#Pakete löschen, die nicht mehr benötigt werden:
	sudo pacman -Scc
	# Beantworte die Fragen mit "y", um den Cache zu löschen
	sudo journalctl --vacuum-time=7d
	# Das löscht alle Log-Dateien, die älter als 7 Tage sind. Du kannst den Wert (7d) nach deinen Bedürfnissen anpassen.
	yay -Rns $(yay -Qdtq)
	# Bereinigen der AUR (Arch User Repository) Pakete
#
#
#