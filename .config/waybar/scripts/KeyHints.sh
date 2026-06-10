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
# KeyHints – Cheat Sheet mit rofi
# Setup
  pkill rofi || true
  # Dynamische Fensterbreite berechnen
  MON=$(hyprctl monitors | grep "at " | head -1 | awk '{print $1}' | cut -d'@' -f1 | cut -d'x' -f1)
  ROFI=$(( MON * 66 / 100 ))
  TARGET=$(( ROFI / 22 ))
  # Cheat Sheet
  cat << 'DATA' | while IFS= read -r line; do
─── ⌨️ KEYBINDS ───
ESC                              
SUPER/mainMod     (Windows Key)
─── HYPRLAND ───
hyprland         Hyprland --quiet
─── 📂 NAVIGATION ───
..               cd ..
conf             cd ~/.config/
─── 📋 DATEIEN ───
ls               ls mit Icons
ll               ls detailliert
lt               ls als Baum
l                lsblk (Laufwerke anzeigen)
fp               fzf-Vorschau mit bat
vf               Datei aus fp in nvim öffnen
lastmod          zuletzt geänderte Dateien finden
─── ENV ───
visual           $VISUAL
editor           $EDITOR
term             $TERM
shell            $SHELL
─── 🚀 APPS ───
v                nvim
s                subl
f                fastfetch
k                kitty +kitten icat
─── ⚙️ SYSTEM ───
c                clear
ex               exit
sys              pacman -Syyu
spo              poweroff
srb              reboot
cleanup          System-Bereinigung
─── 🌱 GIT ───
gs               git status
ga               git add
gc               git commit -m
gp               git push
gpl              git pull
gst              git stash
gsp              git stash + pull
gfo              git fetch origin
gcheck           git checkout
gcredential      git Login speichern
DATA
      if [[ "$line" =~ ^─── ]]; then
          # Überschrift
          clean=$(echo "$line" | sed 's/^─── //;s/ ───$//')
          pad=$(( TARGET - (${#clean} / 2) ))
          printf "%${pad}s<span bgcolor='#2CFF05' color='#2323FF'>%s</span>\n" "" "$clean"
      elif [[ -n "$line" ]]; then
          # Keybind-Zeile
          key=$(echo "$line" | awk -F'  +' '{print $1}')
          cmd=$(echo "$line" | awk -F'  +' '{print $2}')
          pad=$((TARGET - ${#key}))
          printf "%${pad}s%s → %s\n" "" "$key" "$cmd"
      else
          echo
      fi
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