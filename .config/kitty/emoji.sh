#!/bin/bash
#
#
# ██╗  ██╗██╗████████╗████████╗██╗   ██╗
# ██║ ██╔╝██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝
# █████╔╝ ██║   ██║      ██║    ╚████╔╝
# ██╔═██╗ ██║   ██║      ██║     ╚██╔╝
# ██║  ██╗██║   ██║      ██║      ██║
# ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝
#
    # Spezial-Emoji, das immer einzeln bleibt (niemals in Kombinationen)
    special_emoji="𐱅𐰇𐰼𐰰"
    # Alle anderen Emojis (können einzeln oder kombiniert werden)
    other_emojis=("☪︎" "⏾" "✡︎" "☣︎" "𓃦" "𓃚" "☕︎")
    # Hilfsfunktion: Alle Kombinationen einer bestimmten Länge aus other_emojis generieren (Reihenfolge wichtig, ohne Wiederholung)
    generate_combs() {
        local prefix="$1"
        local start=$2
        local depth=$3
        if (( depth == 0 )); then
            echo "$prefix"
            return
        fi
        for ((i=start; i<${#other_emojis[@]}; i++)); do
            generate_combs "${prefix}${other_emojis[$i]}" $((i+1)) $((depth-1))
        done
    }
    # Alle aktuell verwendeten Tab-Titel abrufen
    used_titles=$(kitty @ ls 2>/dev/null | jq -r '.[].tabs[].title' | grep -v '^$')
    # 1. Spezial-Emoji bevorzugt behandeln (wenn noch nicht verwendet)
    if ! grep -Fxq "$special_emoji" <<< "$used_titles"; then
        kitty @ set-tab-title "$special_emoji"
        exit 0
    fi
    # 2. Einzelemojis aus other_emojis, die noch nicht vorkommen
    available_singles=()
    for e in "${other_emojis[@]}"; do
        if ! grep -Fxq "$e" <<< "$used_titles"; then
            available_singles+=("$e")
        fi
    done
    if (( ${#available_singles[@]} > 0 )); then
        random_emoji=${available_singles[$RANDOM % ${#available_singles[@]}]}
        kitty @ set-tab-title "$random_emoji"
        exit 0
    fi
    # 3. Alle Einzelemojis (ausser special) sind belegt → Kombinationen aus other_emojis
    max_len=${#other_emojis[@]}
    for len in $(seq 2 $max_len); do
        while IFS= read -r comb; do
            if ! grep -Fxq "$comb" <<< "$used_titles"; then
                kitty @ set-tab-title "$comb"
                exit 0
            fi
        done < <(generate_combs "" 0 $len)
    done
    # Fallback (sollte nie eintreten)
    kitty @ set-tab-title "${other_emojis[0]}"
#
#
#
