# 🐧 Arch Linux Configuration – TomaKing

![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white)
![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-FF4088?logo=hyprland&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=white)
![Kitty](https://img.shields.io/badge/Kitty-000000?logo=kitty&logoColor=white)
![Waybar](https://img.shields.io/badge/Waybar-4DC5F4?logo=waybar&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue)
![Status](https://img.shields.io/badge/Status-Abgeschlossen-brightgreen)

---

## 📖 INHALTSVERZEICHNIS

- [📝 PROJEKTBESCHREIBUNG](#-projektbeschreibung)
- [✨ FEATURES](#-features)
- [🖼️ SCREENSHOTS](#️-screenshots)
- [📁 STRUKTUR](#-struktur)
- [🚀 INSTALLATION](#-installation)
- [⚙️ KONFIGURATION](#️-konfiguration)
- [🛠️ CUSTOM SCRIPTS](#️-custom-scripts)
- [🎨 THEMES](#-themes)
- [📦 PAKETMANAGEMENT](#-paketmanagement)
- [⚠️ WICHTIGE HINWEISE](#️-wichtige-hinweise)
- [📝 LIZENZ](#-lizenz)
- [👤 AUTOR](#-autor)
- [📊 REPOSITORY STATISTIK](#-repository-statistik)

---

## 📝 PROJEKTBESCHREIBUNG

Willkommen in meiner persönlichen Arch-Linux-Konfiguration – einer sorgfältig kuratierten Sammlung von **Dotfiles**, **Custom Scripts** und **Themes**, die meinen täglichen Workflow auf Hyprland definieren.  
Dieses Repository ist kein generisches Template, sondern der exakte Stand meines Systems: von der Tastaturbelegung über Fensteranimationen bis hin zu den Farben der Statusleiste.

**Warum diese Konfiguration?**  
- Sie zeigt, wie ein modernes, Wayland-basiertes Linux-Desktop-Setup aussehen kann.  
- Sie dient als Dokumentation meiner eigenen Optimierungen und als Inspiration für andere Enthusiasten.  
- Alle Einstellungen sind bewusst kommentiert und in einzelne Module zerlegt, sodass sie leicht verstanden und angepasst werden können.

**Für wen ist das?**  
- Für mich selbst – als Backup und Referenz.  
- Für Arch-Linux-Einsteiger, die ein vollständiges, funktionierendes Beispiel suchen.  
- Für erfahrene Nutzer, die Anregungen für Themes (Anime, Ottoman Empire), Waybar-Styling oder Hyprland-Animationen mitnehmen möchten.

Die Konfiguration wird kontinuierlich weiterentwickelt und an neue Tools sowie meine eigenen Vorlieben angepasst. Wenn du etwas Brauchbares findest, freue ich mich – wenn du Fragen hast, schreib mir einfach.

---

## ✨ FEATURES

### 🎨 Visuell & Theming

| Feature | Beschreibung | Status |
|-------|-------------|--------|
| Anime Fastfetch | Custom ASCII Art & Animationen | ✅ |
| Ottoman Empire Theme | Historisches Design | ✅ |
| Rainbow Borders | Dynamische Fensterrahmen | ✅ |
| Hyprland Animations | Flüssige Animationen | ✅ |
| Custom Wallpapers | Dynamische Hintergründe | ✅ |

### ⚡ Performance

| Tool | Vorteil |
|----|--------|
| Hyprland (Wayland) | Performance & Security |
| Kitty | GPU-beschleunigt |
| PipeWire | Low-Latency Audio |
| TUI Tools | Ressourcenschonend |

### 🛠️ Produktivität

| Tool | Zweck |
|----|------|
| Neovim | Code Editor |
| Ranger | File Manager |
| Rofi | App Launcher |
| Waybar | Status Bar |
| Cava | Audio Visualizer |

---

## 🖼️ SCREENSHOTS

### 🎨 Terminal ASCII-Art
```text
                        .=:-#=
                       .-#%%#-.
                       -=-++:::
                          :-
                    .             ..
                  :-:              .-.
                 +=                  +*
                **                    @#
               -@-.::::..      ..:-::.*@:
              :#%+#####%%%#++#%@@@#*+=**-.
            -++=*+.   .-#@@@@@#+:.   -#=:::.
          .=:   =*==   :%@@%*=--:  .+@*-   ...
          :     .%@@@=-@@*=::=-+-:+%@*-      ..
                 .*#*+*#+::==##*-+%*-:
    :               ::-:-=+#@%*+=::               .
   +@..:.             =+=::::-=+=-            .. -%. .
:+#@@@#=.             .-==:  +%%==            .-+%%*+=.
  %@##=                .:-:-*@%*:               ##++:
 -+.  :     .            :=#%*+:          ..   .-   :.
              .::::::-=+#%%*==++==-:::---:.
                .:-==*++=:.  .:-=+*+++=:.
```

### 🖥️ Desktop Layout
```text
┌─────────────────────────────────────────────────────────────────────┐
│                [Waybar]                🕐 12:34  📅 15.03   │
├─────────────────────────────────────────────────────────────────────┤
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐                     │
│ │   Neovim    │ │    Kitty    │ │    Files    │                     │
│ │            │ │            │ │            │                     │
│ │             │ │             │ │             │                     │
│ │             │ │             │ │             │                     │
│ └─────────────┘ └─────────────┘ └─────────────┘                     │
│                                                                     │
│ ┌──────────────────────────────────────────────────────────────┐    │
│ │                     [Cava Audio Visualizer]                  │    │
│ │                    ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁▂▃▄▅▆▇█▇▆▅▄▃▂▁         │    │
│ └──────────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 📁 STRUKTUR

### 📂 Hauptverzeichnis
```text
ArchLinux/
├── 📁 .config/                  # Konfigurationsdateien
├── 📁 .local/                   # Lokale Daten & Skripte
├── 📄 aur-packages.txt          # 🎁 AUR Paketliste
├── 📄 packages.x86_64           # 📦 Offizielle Paketliste
├── 📄 .bashrc                   # 🐚 Bash Konfiguration
├── 📄 .gitconfig                # 🔧 Git Einstellungen
├── 📄 .xinitrc                  # 🖥️ X11 Startskript
└── 📄 README                    # 📖 Diese Datei
```

## 🎛️ .config/ Ordner Details
```text
.config/
├── 🎵 cava/                    # Audio Visualizer
│   ├── config                  # Visualizer Einstellungen
│   └── shaders/                # GPU Shader Effekte
│
├── 🖥️ fastfetch/               # System Info Tool
│   ├── 🎌 AnimeEdit/           # Anime ASCII Art
│   │   ├── *.mp4               # Animierte Beispiele
│   │   └── animation.sh        # Animationsskripte
│   ├── 🏛️ ottoman/             # Ottoman Empire Theme
│   │   ├── ottoman.jpeg        # Hintergrundbild
│   │   └── config.jsonc        # Theme Konfiguration
│   └── asciiart/               # ASCII Kunst Designs
│
├── 🪟 hypr/                     # Hyprland WM
│   ├── ⚙️ hyprland.conf        # Hauptkonfiguration
│   ├── 🎭 animations.conf      # Fensteranimationen
│   ├── 🔒 hyprlock.conf        | Lock Screen
│   ├── 🎨 hyprpaper.conf       | Wallpaper Manager
│   ├── 🖼️ background*.png      | Wallpaper Sammlung
│   └── 🎨 wallust.conf         | Farbabstimmung
│
├── 🖥️ kitty/                   # Terminal Emulator
│   ├️ ⚙️ kitty.conf             | Terminal Einstellungen
│   ├️ 🎨 theme.conf             | Farbschema
│   └️ 😀 emoji.sh               | Emoji Support
│
├️ 🖋️ nvim/                     # Neovim IDE
│   └️ 📜 lua/                  | Lua Konfiguration
│       ├️ ⚙️ init.lua          | Hauptkonfiguration
│       └️ 🔒 lazy-lock.json     | Plugin Lockfile
│
├️ 📁 ranger/                   # TUI File Manager
│   ├️ 🎨 colorschemes/         | Farbschemata
│   └️ 🔌 plugins/              | Erweiterungen
│       └️ 🎨 ranger_devicons/  | File Icons
│
├️ 🚀 rofi/                     # App Launcher
│   ├️ 🎨 colors.rasi           | Farben
│   ├️ ⚙️ config.rasi           | Layout
│   └️ ⌨️ keybinds.rasi         | Tastenkürzel
│
├️ 📝 sublime-text/              # Sublime Text Editor
│   └️ 👤 Packages/User/         | Benutzerpakete
│       ├️ 🎨 Guna/              | Guna Theme
│       └️ ⚙️ *.sublime-settings | Editor Einstellungen
│
└️ 📊 waybar/                    # Status Bar
    ├️ ⚙️ config/                | Module Konfiguration
    ├️ 🛠️ scripts/               | Custom Skripte
    │   ├️ 🌤️ Weather.py         | Wetter Anzeige
    │   ├️ ☀️ Brightness.sh      | Helligkeit
    │   ├️ 🎵 WaybarCava.sh      | Audio Visualizer
    │   ├️ 🌈 RainbowBorders.sh  | Farbige Fensterränder
    │   └️ 🔒 LockScreen.sh      | Lock Screen
    └️ 🎨 style.css              | CSS Styling
```

### 🗂️ .local/ Ordner
```text
.local/
├── 📁 share/                   # Shared Data
│   ├️ 🖥️ applications/          | Desktop Entries
│   ├️ 🖋️ nvim/                  | Neovim Runtime
│   └️ 📁 ranger/                | Ranger Data
├── 📁 state/                   | Application State
│   └️ 🖋️ nvim/                  | Neovim State
└── 🎵 wireplumber/             | Audio Session Manager
```

---

## 🚀 INSTALLATION

### 📥 1. Repository klonen
```bash
git clone https://github.com/mucahid-emin-tomakin/ArchLinux.git  #🔄Klonen Sie das Repository
cd ArchLinux  #📂In das Verzeichnis wechseln
```

### 🔗 2. Dotfiles verlinken
```bash
#🔗 Symlinks für Konfigurationen erstellen
ln -sf ~/ArchLinux/.bashrc ~/.bashrc
ln -sf ~/ArchLinux/.gitconfig ~/.gitconfig
ln -sf ~/ArchLinux/.config/hypr ~/.config/hypr
ln -sf ~/ArchLinux/.config/kitty ~/.config/kitty
ln -sf ~/ArchLinux/.config/nvim ~/.config/nvim
#... Wiederholen für andere Konfigurationen
```

### Alternative mit Installationsskript:
```bash
  #!/bin/bash 📜install-dotfiles.sh
  echo "🔗 Erstelle Symlinks für Dotfiles..."
  CONFIGS=(
      ".bashrc"
      ".gitconfig"
      ".xinitrc"
      ".config/hypr"
      ".config/kitty"
      ".config/nvim"
      ".config/waybar"
      ".config/rofi"
  )
  for config in "${CONFIGS[@]}"; do
      if [ -e "$HOME/ArchLinux/$config" ]; then
          ln -sf "$HOME/ArchLinux/$config" "$HOME/$config"
          echo "✅ Verlinkt: $config"
      fi
  done
  echo "🎉 Installation abgeschlossen!"
```

### 📦 3. Pakete installieren
```bash
sudo pacman -S --needed - < packages.x86_64  #📦Offizielle Pakete installieren
yay -S - < aur-packages.txt  #🎁AUR Pakete (yay erforderlich)
```

### Paketlisten verwalten:
```bash
pacman -Qqen > packages.x86_64  #💾Aktuelle Paketliste exportieren
pacman -Qqem > aur-packages.txt
grep -i "neovim" packages.x86_64  #🔍Nach bestimmten Paketen suchen
```

---

## ⚙️ KONFIGURATION

### 💧 Hyprland Window Manager
```conf
# 🎨 Fensterdekoration
  decoration {
      rounding = 10
      blur = true
      blur_size = 8
      blur_passes = 3
      drop_shadow = true
      shadow_range = 4
      shadow_render_power = 3
  }
# 🎭 Animationen
  animations {
      enabled = true
      bezier = myBezier, 0.05, 0.9, 0.1, 1.05
      animation = windows, 1, 7, myBezier
      animation = borderangle, 1, 8, default
  }
```

### 📊 Waybar Status Bar
```css
/* 🎨 CSS Styling für Waybar */
  #waybar {
      background-color: rgba(40, 42, 54, 0.9);
      border-radius: 10px;
      margin: 5px;
      padding: 0 10px;
  }
  #workspaces button {
      padding: 0 5px;
      background: transparent;
      color: #f8f8f2;
      border-radius: 5px;
  }
  #workspaces button.active {
      background: #6272a4;
  }
```

### 🖥️ Kitty Terminal
```conf
# ⚡ Performance Einstellungen
  scrollback_lines 10000
  repaint_delay 10
  input_delay 3
  sync_to_monitor yes
# 🎨 Color Scheme
  foreground #f8f8f2
  background #282a36
  selection_foreground #ffffff
  selection_background #44475a
```

### 🖋️ Neovim Lua Config
```lua
-- 🚀 Lazy.nvim Plugin Manager
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
```

### 🛠️ Custom Scripts
```python
#!/usr/bin/env python3 🌤️ Weather.py - Wetter Anzeige
  """
  🌤️ Wetter Anzeige für Waybar
  Zeigt aktuelles Wetter mit Icons an
  """
  import requests
  import json
  def get_weather():
      try:
          response = requests.get("http://wttr.in/?format=j1")
          data = response.json()     
          temp = data['current_condition'][0]['temp_C']
          desc = data['current_condition'][0]['weatherDesc'][0]['value']        
          #🌤️Wetter Icons
          icons = {
              "Sunny": "☀️",
              "Clear": "🌙",
              "Cloudy": "☁️",
              "Rain": "🌧️",
              "Snow": "❄️"
          }      
          icon = icons.get(desc, "🌡️")
          return f"{icon} {temp}°C"
      except:
          return "🌐 Wetter Fehler"
  if __name__ == "__main__":
      print(get_weather())
```

### 🌈 RainbowBorders.sh - Farbige Fensterränder
```bash
#!/bin/bash  🌈  Wechselt Fensterrahmenfarben im Regenbogen-Effekt
  COLORS=(
      "rgb(ff0000)"  # 🔴 Rot
      "rgb(ff7f00)"  # 🟠 Orange
      "rgb(ffff00)"  # 🟡 Gelb
      "rgb(00ff00)"  # 🟢 Grün
      "rgb(0000ff)"  # 🔵 Blau
      "rgb(4b0082)"  # 🟣 Indigo
      "rgb(9400d3)"  # 🟣 Violett
  )
  while true; do
      for color in "${COLORS[@]}"; do
          hyprctl keyword general:col.active_border "$color"
          sleep 0.5
      done
  done
```

### 🎌 Anime Theme Aktivieren
```bash
#!/bin/bash  🎌  Aktiviert das Anime Fastfetch Theme
  echo "🎌 Aktiviere Anime Theme..."
  fastfetch --config ~/.config/fastfetch/AnimeEdit/config.jsonc
# 🖼️ Anime Wallpaper setzen
  hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/background.png"
# 🎨 Passendes Color Scheme
  wal -i ~/.config/hypr/background.png
```

### 🏛️ Ottoman Empire Theme
```bash
#!/bin/bash  🏛️  Aktiviert Ottoman Empire Theme
  echo "🕌 Aktiviere Ottoman Empire Theme..."
  fastfetch --config ~/.config/fastfetch/ottoman/config.jsonc
# 🖼️ Ottoman Wallpaper
  hyprctl hyprpaper wallpaper "eDP-1,~/.config/fastfetch/ottoman/ottoman.jpeg"
# 🔊 Ottoman Musik (optional)
  mpv ~/.config/fastfetch/ottoman/ottoman_music.mp3 &
```

---

## 🎨 THEMES

### 🎌 Anime Edit Theme
```text
THEME: Anime Edit
├── 🎨 Colors: Pastell Blau/Rosa
├── 🖼️ Wallpaper: Anime Hintergründe
├── 🎵 Audio: J-Pop/J-Rock
└── 🎮 Icons: Anime-stilisiert
```

### 🏛️ Ottoman Empire Theme
```text
THEME: Ottoman Empire
├── 🎨 Colors: Gold, Rot, Türkis
├── 🖼️ Wallpaper: Osmanische Kunst
├── 📜 Font: Arabisch-inspiriert
└── 🎵 Audio: Traditionelle Musik
```

### 🌈 Rainbow Theme
```text
THEME: Rainbow Borders
├── 🎨 Colors: Regenbogen Spektrum
├── 🔄 Effect: Farbwechsel Animation
├── ⚡ Performance: Leichtgewichtig
└── 🎯 Customization: Einfach anpassbar
```

---

## 📦 PAKETMANAGEMENT

### 📊 Paketstatistiken
```bash
# 📈 Anzahl der Pakete zählen
OFFICIAL_COUNT=$(wc -l < packages.x86_64)
AUR_COUNT=$(wc -l < aur-packages.txt)
TOTAL=$((OFFICIAL_COUNT + AUR_COUNT))
echo "📦 Paketstatistik:"
echo "  🏛️  Offizielle: $OFFICIAL_COUNT"
echo "  🎁 AUR: $AUR_COUNT"
echo "  📊 Total: $TOTAL"
```

### 🔍 Pakete durchsuchen
```bash
# 🔎 Nach bestimmten Kategorien suchen
grep -i "editor" packages.x86_64    # 📝 Editoren
grep -i "terminal" packages.x86_64  # 🖥️ Terminal
grep -i "audio" packages.x86_64     # 🎵 Audio
grep -i "network" packages.x86_64   # 🌐 Netzwerk
```

### 🗑️ Pakete bereinigen
```bash
# 🧹 Nicht benötigte Pakete entfernen
sudo pacman -Rns $(pacman -Qtdq)  # Orphaned Packages
# 📦 Cache bereinigen
sudo pacman -Sc                   # Package Cache
yay -Sc                           # AUR Cache
```

---

## ⚠️ WICHTIGE HINWEISE

### 🔒 Sicherheit
- Diese Konfiguration ist hochgradig persönlich angepasst
- Überprüfen Sie Skripte vor der Ausführung
- Backup erstellen vor großen Änderungen
- Nicht auf Produktivsystemen ohne Testing verwenden

### 💡 Empfehlungen
- Testing - In VM oder auf Testsystem zuerst ausprobieren
- Backup - Eigene Konfigurationen sichern
- Anpassen - Auf eigene Hardware/Präferenzen anpassen
- Lernen - Verstehen, was jede Konfiguration macht

---

## 📝 LIZENZ

  Dieses Projekt ist unter der **MIT License** lizenziert - frei für persönliche und kommerzielle Nutzung.

---

## 👤 AUTOR

**Mücahid Emin Tomakin (TomaKing)**

| Platform | Link | Icon |
|----------|------|------|
| **GitHub** | [@mucahid-emin-tomakin](https://github.com/mucahid-emin-tomakin) | 🐙 |
| **Arch Linux** | Enthusiast & Customization Lover | 🐧 |
| **Interessen** | Linux, Programming, Anime, History | 💻 |

**Über dieses Repository:**
- 🎯 **Ziel:** Persönliche Linux-Konfiguration teilen
- 📚 **Lernressource:** Für Arch Linux Einsteiger
- 🎨 **Inspiration:** Custom Themes und Designs
- 🔧 **Werkzeuge:** Optimierte Development Environment

---

## 📊 REPOSITORY STATISTIK

| Metrik | Wert | Trend |
|--------|------|-------|
| **Stars** | ![GitHub Stars](https://img.shields.io/github/stars/mucahid-emin-tomakin/ArchLinux) | 📈 |
| **Forks** | ![GitHub Forks](https://img.shields.io/github/forks/mucahid-emin-tomakin/ArchLinux) | 🔄 |
| **Issues** | ![GitHub Issues](https://img.shields.io/github/issues/mucahid-emin-tomakin/ArchLinux) | ✅ |
| **Letztes Update** | ![GitHub Last Commit](https://img.shields.io/github/last-commit/mucahid-emin-tomakin/ArchLinux) | 🕐 |

---

### 🔧 Made with ❤️ on Arch Linux
