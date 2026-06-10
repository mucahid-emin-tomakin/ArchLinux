#!/bin/bash
#
#
# ████████╗ ██████╗ ███╗   ███╗ █████╗ ██╗  ██╗██╗███╗   ██╗ ██████╗ 
# ╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗██║ ██╔╝██║████╗  ██║██╔════╝ 
#    ██║   ██║   ██║██╔████╔██║███████║█████╔╝ ██║██╔██╗ ██║██║  ███╗
#    ██║   ██║   ██║██║╚██╔╝██║██╔══██║██╔═██╗ ██║██║╚██╗██║██║   ██║
#    ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║██║  ██╗██║██║ ╚████║╚██████╔╝
#
    # install.sh – Neon-Hyprland Setup vollautomatisch einrichten
    #
    # git clone https://github.com/mucahid-emin-tomakin/ArchLinux
    # cd ArchLinux
    # chmod +x install.sh && ./install.sh
    set -euo pipefail
    # ════════════════════════════════════════════════════════════════════════
    # Farben & Hilfsfunktionen (früh definieren)
    # ════════════════════════════════════════════════════════════════════════
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    CYAN='\033[0;36m'
    YELLOW='\033[1;33m'
    NC='\033[0m'
    info()  { echo -e "${CYAN}[INFO]${NC} $*"; }
    ok()    { echo -e "${GREEN}[OK]${NC} $*"; }
    err()   { echo -e "${RED}[FEHLER]${NC} $*"; }
    warn()  { echo -e "${YELLOW}[WARNUNG]${NC} $*"; }
    has()   { command -v "$1" >/dev/null 2>&1; }
    # ════════════════════════════════════════════════════════════════════════
    # Cleanup (Aufräumfunktion)
    # ════════════════════════════════════════════════════════════════════════
    cleanup() {
        warn "Skript abgebrochen – räume temporäre Dateien auf"
        rm -rf /tmp/yay 2>/dev/null
    }
    trap cleanup EXIT INT TERM
    # ════════════════════════════════════════════════════════════════════════
    # 0. System-Check (Preflight)
    # ════════════════════════════════════════════════════════════════════════
    # Prüfen, ob das Skript als root ausgeführt wird (soll nicht sein)
    if [[ $EUID -eq 0 ]]; then
        err "Dieses Skript sollte NICHT als root ausgeführt werden."
        echo "Bitte führe es als normaler Benutzer aus (sudo wird bei Bedarf abgefragt)."
        exit 1
    fi
    # Prüfen, ob wir unter Arch Linux sind
    if [[ ! -f /etc/arch-release ]]; then
        err "Dieses Skript ist nur für Arch Linux entwickelt worden."
        exit 1
    fi
    # Prüfen, ob Pacman verfügbar ist (sollte immer sein, aber sicherheitshalber)
    if ! has pacman; then
        err "Pacman nicht gefunden. Dies scheint kein Arch Linux zu sein."
        exit 1
    fi
    # Prüfen, ob eine Internetverbindung besteht
    if ! ping -c 1 archlinux.org >/dev/null 2>&1; then
        err "Keine Internetverbindung. Bitte verbinde dich mit dem Internet."
        exit 1
    fi
    # Prüfen, ob Pacman-Schlüsselring initialisiert ist (frisches System)
    if ! pacman-key --list-keys >/dev/null 2>&1; then
        info "Pacman-Schlüsselring nicht initialisiert. Führe 'pacman-key --init' aus..."
        sudo pacman-key --init
        sudo pacman-key --populate archlinux
    fi
    # Prüfen, ob Systemzeit einigermaßen aktuell ist (wichtig für HTTPS/TLS)
    if [[ $(date +%Y) -lt 2024 ]]; then
        warn "Systemzeit scheint falsch zu sein. Führe 'timedatectl set-ntp true' aus."
        sudo timedatectl set-ntp true
    fi
    ok "System-Check bestanden – Umgebung ist in Ordnung."
    # ════════════════════════════════════════════════════════════════════════
    # 1. Basis-Verzeichnis des Repos ermitteln
    # ════════════════════════════════════════════════════════════════════════
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    REPO_DIR="$SCRIPT_DIR"
    # Prüfe, ob wichtige Konfigurationsordner existieren (z.B. .config/hypr)
    if [[ ! -d "$REPO_DIR/.config/hypr" ]]; then
        err "Keine gültige Repo-Struktur gefunden: .config/hypr fehlt."
        echo "Bitte stelle sicher, dass du das Skript aus dem Wurzelverzeichnis deines geklonten Repos ausführst (ArchLinux)."
        exit 1
    fi
    # ════════════════════════════════════════════════════════════════════════
    # 2. Bestehende Konfiguration sichern
    # ════════════════════════════════════════════════════════════════════════
    BACKUP_DIR="$HOME/.config/backup_$(date +%Y%m%d_%H%M%S)"
    info "Sichere bestehende Konfiguration nach $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    for dir in hypr waybar rofi kitty fastfetch dunst wallust cava btop nvtop mpv systemd; do
        [[ -d "$HOME/.config/$dir" ]] && cp -r "$HOME/.config/$dir" "$BACKUP_DIR/" 2>/dev/null
    done
    for file in .bashrc .bash_profile .gtkrc-2.0 .xsettingsd.conf starship.toml; do
        [[ -f "$HOME/$file" ]] && cp "$HOME/$file" "$BACKUP_DIR/" 2>/dev/null
    done
    ok "Backup abgeschlossen"
    # ════════════════════════════════════════════════════════════════════════
    # 3. Notwendige Pakete installieren mit Hardware-Erkennung (GPU, CPU, VM)
    # ════════════════════════════════════════════════════════════════════════
    detect_gpu() {
        local gpu=""
        if lspci | grep -E "VGA|3D" | grep -qi "nvidia"; then
            gpu="nvidia"
        elif lspci | grep -E "VGA|3D" | grep -qi "amd"; then
            gpu="amd"
        elif lspci | grep -E "VGA|3D" | grep -qi "intel"; then
            gpu="intel"
        elif lspci | grep -E "VGA|3D" | grep -qi "vmware"; then
            gpu="vmware"
        elif lspci | grep -E "VGA|3D" | grep -qi "virtualbox"; then
            gpu="vbox"
        else
            gpu="unknown"
        fi
        echo "$gpu"
    }
    detect_cpu() {
        if grep -qi "intel" /proc/cpuinfo; then
            echo "intel"
        elif grep -qi "amd" /proc/cpuinfo; then
            echo "amd"
        else
            echo "unknown"
        fi
    }
    detect_vm() {
        if systemd-detect-virt --vm >/dev/null 2>&1; then
            echo "true"
        else
            echo "false"
        fi
    }
    GPU=$(detect_gpu)
    CPU=$(detect_cpu)
    VM=$(detect_vm)
    info "Erkannte Hardware: GPU=$GPU, CPU=$CPU, VM=$VM"
    info "Installiere benötigte Pakete..."
    PACMAN_PKGS_BASE=(
        hyprland waybar rofi kitty dunst starship fastfetch
        hyprlock hypridle hyprpolkitagent hyprcursor
        cava btop nvtop grim imagemagick jq
        playerctl pamixer brightnessctl
        bluez bluez-utils blueman
        ttf-liberation ttf-opensans
        ttf-jetbrains-mono-nerd ttf-dejavu
        noto-fonts noto-fonts-emoji noto-fonts-cjk
        pipewire wireplumber pipewire-pulse
        pipewire-alsa alsa-utils
        xdg-desktop-portal-hyprland qt6-wayland
        gnome-themes-extra gtk3
        mpv mpvpaper ranger nvim bat tmux
        curl wget unzip 7zip usbutils lolcat
        wl-clipboard eza fzf ffmpeg
        ffmpegthumbnailer trash-cli 
        cups cups-pk-helper system-config-printer
        base-devel git networkmanager wpa_supplicant
        bash-completion cmake python-pillow
    )
    # GPU-spezifische Pakete
    GPU_PKGS=()
    if [[ "$VM" == "true" ]]; then
        info "VM erkannt – verwende nur grundlegende Grafiktreiber"
        GPU_PKGS=(xf86-video-fbdev mesa-utils)
    elif [[ "$GPU" == "nvidia" ]]; then
        info "NVIDIA-Grafik erkannt – installiere nvidia-open und Wayland-Unterstützung"
        GPU_PKGS=(nvidia-open nvidia-prime nvidia-utils lib32-nvidia-utils nvidia-settings egl-wayland)
    elif [[ "$GPU" == "amd" ]]; then
        info "AMD-Grafik erkannt – installiere mesa und Vulkan"
        GPU_PKGS=(mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon)
    elif [[ "$GPU" == "intel" ]]; then
        info "Intel-Grafik erkannt – installiere mesa und Vulkan (Intel)"
        GPU_PKGS=(mesa lib32-mesa vulkan-intel lib32-vulkan-intel intel-media-driver libva-intel-driver)
    elif [[ "$GPU" == "vmware" ]]; then
        info "VMware erkannt – installiere open-vm-tools"
        GPU_PKGS=(xf86-video-vmware open-vm-tools)
    elif [[ "$GPU" == "vbox" ]]; then
        info "VirtualBox erkannt – installiere virtualbox-guest-utils"
        GPU_PKGS=(virtualbox-guest-utils)
    else
        info "Unbekannte GPU – installiere Standard-Mesa"
        GPU_PKGS=(mesa mesa-utils)
    fi
    # CPU-spezifische Mikrocode-Pakete
    CPU_PKGS=()
    if [[ "$VM" == "false" ]]; then
        if [[ "$CPU" == "intel" ]]; then
            CPU_PKGS=(intel-ucode)
        elif [[ "$CPU" == "amd" ]]; then
            CPU_PKGS=(amd-ucode)
        fi
    fi
    # Finale Paketliste zusammenführen
    PACMAN_PKGS=("${PACMAN_PKGS_BASE[@]}" "${GPU_PKGS[@]}" "${CPU_PKGS[@]}")
    info "Folgende Pakete werden installiert: ${PACMAN_PKGS[*]}"
    sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}" || {
        err "Einige Pakete konnten nicht installiert werden."
        exit 1
    }
    ok "Basis-Pakete installiert"
    # AUR-Helper yay installieren, falls nicht vorhanden
    if ! has yay; then
        info "Installiere yay (AUR-Helper)..."
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm)
        rm -rf /tmp/yay
        ok "yay installiert"
    fi
    AUR_PKGS=(
        awww
        pulsemixer
        sublime-text
        google-chrome
        ascii-image-converter-git
    )
    info "Installiere AUR-Pakete..."
    yay -S --needed --noconfirm "${AUR_PKGS[@]}" || {
        err "Einige AUR-Pakete konnten nicht installiert werden."
        # nicht kritisch, wir machen weiter
    }
    ok "AUR-Pakete installiert"
    # Wallust könnte auch via pacman installiert sein – sicherheitshalber beide Quellen anbieten
    if ! has wallust; then
        yay -S --needed --noconfirm wallust || true
    fi
    # ════════════════════════════════════════════════════════════════════════
    # 4. Dotfiles kopieren
    # ════════════════════════════════════════════════════════════════════════
    info "Kopiere Dotfiles nach $HOME..."
    if has rsync; then
        rsync -av --exclude='.git' --exclude='install.sh' "$REPO_DIR/" "$HOME/"
    else
        shopt -s dotglob
        for item in "$REPO_DIR"/* "$REPO_DIR"/.[!.]*; do
            [[ -e "$item" ]] || continue
            basename=$(basename "$item")
            [[ "$basename" == ".git" || "$basename" == "install.sh" ]] && continue
            cp -r "$item" "$HOME/"
        done
        shopt -u dotglob
    fi
    ok "Dotfiles kopiert"
    # ════════════════════════════════════════════════════════════════════════
    # 5. Skripte ausführbar machen
    # ════════════════════════════════════════════════════════════════════════
    info "Setze Ausführungsrechte für Skripte..."
    find "$HOME/.config" -type f -name "*.sh" -exec chmod +x {} \; 2>/dev/null || true
    ok "Skript-Rechte gesetzt"
    # ════════════════════════════════════════════════════════════════════════
    # 6. Wallust initialisieren (optional)
    # ════════════════════════════════════════════════════════════════════════
    if has wallust && [[ -f "$HOME/.config/hypr/ottoman.jpg" ]]; then
        info "Initialisiere Wallust mit deinem Wallpaper..."
        wallust run "$HOME/.config/hypr/ottoman.jpg" -s || true
        ok "Wallust-Farben generiert"
    fi
    # ════════════════════════════════════════════════════════════════════════
    # 7. Hyprland-Cache leeren
    # ════════════════════════════════════════════════════════════════════════
    rm -rf "$HOME/.cache/hyprland" 2>/dev/null || true
    rm -rf "$HOME/.cache/hypr" 2>/dev/null || true
    ok "Cache geleert"
    # ════════════════════════════════════════════════════════════════════════
    # 8. Abschlussmeldung
    # ════════════════════════════════════════════════════════════════════════
    echo ""
    echo "╔══════════════════════════════════════════════╗"
    echo "║  🎉 Installation abgeschlossen! 🎉         ║"
    echo "╚══════════════════════════════════════════════╝"
    echo ""
    echo "► Bitte starte Hyprland (falls es bereits läuft, starte es neu, oder melde dich ab und wieder an)."
    echo "► Deine bisherige Konfiguration wurde gesichert unter:"
    echo "   $BACKUP_DIR"
    echo ""
    echo "Genieße dein Neon-Setup! 🌈🚀"
    echo ""
    read -p "❓ Hyprland jetzt starten? (j/n): " start_hypr
    if [[ "$start_hypr" =~ ^[JjYy]$ ]]; then
        info "Starte Hyprland ..."
        if has Hyprland; then
            nohup Hyprland > /tmp/hyprland.log 2>&1 & #exec Hyprland
            info "Hyprland wurde im Hintergrund gestartet (Log: /tmp/hyprland.log)"
        else
            err "Hyprland nicht im Pfad gefunden. Bitte starte es manuell."
        fi
    else
        echo "Du kannst Hyprland später mit 'Hyprland' starten."
    fi
#
#
#