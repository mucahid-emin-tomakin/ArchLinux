#!/bin/bash
#
#
# ███████╗███████╗███████╗███████╗██╗ ██████╗ ███╗   ██╗███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗ 
# ██╔════╝██╔════╝██╔════╝██╔════╝██║██╔═══██╗████╗  ██║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗
# ███████╗█████╗  ███████╗███████╗██║██║   ██║██╔██╗ ██║██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝
# ╚════██║██╔══╝  ╚════██║╚════██║██║██║   ██║██║╚██╗██║██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗
# ███████║███████╗███████║███████║██║╚██████╔╝██║ ╚████║██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║
# ╚══════╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
#
    # SessionManager – speichert und stellt Fenster mit Position und Workspace wieder her
    SESSION_FILE="$HOME/.local/share/SessionManager/state.json"
    LOG_DIR="/tmp/SessionManager"
    mkdir -p "$LOG_DIR" "$(dirname "$SESSION_FILE")"
    log() {
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_DIR/SessionManager.log"
    }
    # --- Funktion: save_state ---
    save_state() {
        log "Session wird gespeichert..."
        local tmp_file="${SESSION_FILE}.tmp"
        if ! hyprctl clients -j > "$tmp_file"; then
            log "FEHLER: Konnte Fensterliste nicht von hyprctl abrufen."
            notify-send -u critical "SessionManager" "Fehler beim Speichern – hyprctl nicht erreichbar."
            return 1
        fi
        if mv "$tmp_file" "$SESSION_FILE"; then
            log "Session erfolgreich in $SESSION_FILE gespeichert."
            notify-send -u normal "SessionManager" "Alle Fenster & Positionen gesichert."
        else
            log "FEHLER: Konnte temporäre Datei nicht nach $SESSION_FILE verschieben."
            notify-send -u critical "SessionManager" "Fehler beim Speichern – Dateizugriff fehlgeschlagen."
            return 1
        fi
    }
    # --- Funktion: restore_state ---
    restore_state() {
        if [[ ! -f "$SESSION_FILE" ]]; then
            log "Keine gespeicherte Session gefunden. Starte ohne Wiederherstellung."
            notify-send -u low "SessionManager" "Keine gespeicherte Session gefunden."
            return 0
        fi
        log "Beginne mit der Wiederherstellung der Session aus $SESSION_FILE..."
        if ! command -v jq &> /dev/null; then
            log "FEHLER: 'jq' ist nicht installiert."
            notify-send -u critical "SessionManager" "jq fehlt – Wiederherstellung nicht möglich."
            return 1
        fi
        local window_count
        window_count=$(jq length "$SESSION_FILE")
        log "Es wurden $window_count Fenster in der gespeicherten Session gefunden."
        jq -c '.[]' "$SESSION_FILE" | while read -r entry; do
            class=$(echo "$entry" | jq -r '.class')
            x=$(echo "$entry" | jq -r '.at[0]')
            y=$(echo "$entry" | jq -r '.at[1]')
            w=$(echo "$entry" | jq -r '.size[0]')
            h=$(echo "$entry" | jq -r '.size[1]')
            case "$class" in
                "kitty")
                    cmd="kitty"
                    ;;
                "google-chrome"|"Google-chrome")
                    cmd="google-chrome-stable"
                    ;;
                "sublime_text"|"Sublime_text")
                    cmd="subl"
                    ;;
                *)
                    log "Unbekannte Anwendung '$class' übersprungen."
                    continue
                    ;;
            esac
            # 1. Programm starten
            log "Starte $cmd (Klasse: $class)"
            $cmd &
            # 2. Auf Fenster warten (bis zu 2,5 Sekunden)
            new_addr=""
            for i in {1..11}; do
                new_addr=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$class\") | .address" | tail -1)
                [[ -n "$new_addr" ]] && break
                sleep 0.5
            done
            if [[ -z "$new_addr" ]]; then
                log "WARNUNG: Konnte kein Fenster für Klasse '$class' finden."
                continue
            fi
            log "Positioniere Fenster $new_addr: $x,$y ${w}x${h}"
            hyprctl eval "hl.dsp.window.move({x = $x, y = $y, window = '$new_addr'})"
            hyprctl eval "hl.dsp.window.resize({x = $w, y = $h, window = '$new_addr'})"
            sleep 0.5
        done
        log "Wiederherstellung abgeschlossen."
        notify-send -u normal "SessionManager" "Session erfolgreich wiederhergestellt."
    }
    # --- Hauptprogramm ---
    case "$1" in
        --save)
            save_state
            ;;
        --restore)
            restore_state
            ;;
        *)
            echo "Usage: $0 {--save|--restore}"
            notify-send -u low "SessionManager" "Bitte --save oder --restore angeben."
            exit 1
            ;;
    esac
#
#
#