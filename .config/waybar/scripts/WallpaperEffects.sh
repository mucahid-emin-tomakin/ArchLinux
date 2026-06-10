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
    # Wallpaper Effects mit ImageMagick + awww + wallust + restore_original
    # ═══════════════════════════════════════════════
    # Setup
    # ═══════════════════════════════════════════════
    wallpaper_current="$HOME/.config/hypr/Ottoman.jpg"
    wallpaper_output="$HOME/.config/hypr/OttomanModified.jpg"
    focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
    [[ -z "$focused_monitor" ]] && focused_monitor=$(hyprctl monitors | grep "Monitor" | head -1 | awk '{print $2}')
    CURRENT_EFFECT="$HOME/.cache/wallpaper_effect"
    STYLE_CSS="$HOME/.config/waybar/style.css"
    # awww Animationen
    TRANSITION="any"
    DURATION=2
    FPS=60
    BEZIER=".43,1.19,1,.4"
    ANGLE=45
    # ═══════════════════════════════════════════════
    # restore_original (Waybar + style)
    # ═══════════════════════════════════════════════
    restore_original() {
        # sed WaybarCava.sh
        sed -i \
            -e 's/^WallC0=.*/WallC0="#FF0000"/' \
            -e 's/^WallC1=.*/WallC1="#FF8000"/' \
            -e 's/^WallC2=.*/WallC2="#FFFF00"/' \
            -e 's/^WallC3=.*/WallC3="#00FF00"/' \
            -e 's/^WallC4=.*/WallC4="#00FFFF"/' \
            -e 's/^WallC5=.*/WallC5="#0000FF"/' \
            -e 's/^WallC6=.*/WallC6="#8000FF"/' \
            -e 's/^WallFG=.*/WallFG="#FF00FF"/' \
            "$HOME/.config/waybar/scripts/WaybarCava.sh"
        # sed Style.css
        sed -i \
            -e 's/@define-color WallBlack .*/@define-color WallBlack #000000;/' \
            -e 's/@define-color WallDarkestPurple .*/@define-color WallDarkestPurple #591137;/' \
            -e 's/@define-color WallWeiss .*/@define-color WallWeiss #FFFFFF;/' \
            -e 's/@define-color WallRot .*/@define-color WallRot #FF0000;/' \
            -e 's/@define-color WallOrange .*/@define-color WallOrange #FF3403;/' \
            -e 's/@define-color WallBrightOrange .*/@define-color WallBrightOrange #FF581B;/' \
            -e 's/@define-color WallGrun .*/@define-color WallGrun #00FF00;/' \
            -e 's/@define-color WallGelb .*/@define-color WallGelb #FFFF00;/' \
            -e 's/@define-color WallBrightestOrange .*/@define-color WallBrightestOrange #FFAA00;/' \
            -e 's/@define-color WallBlau .*/@define-color WallBlau #0000FF;/' \
            -e 's/@define-color WallDarkPurple .*/@define-color WallDarkPurple #771646;/' \
            -e 's/@define-color WallPurple .*/@define-color WallPurple #99406C;/' \
            -e 's/@define-color WallMagenta .*/@define-color WallMagenta #ff00a9;/' \
            -e 's/@define-color WallBrightPurple .*/@define-color WallBrightPurple #AB5E86;/' \
            -e 's/@define-color WallBrightestPurple .*/@define-color WallBrightestPurple #C27BA0;/' \
            -e 's/@define-color WallLila .*/@define-color WallLila #9400D3;/' \
            -e 's/@define-color WallTurkis .*/@define-color WallTurkis #00FEFC;/' \
            -e 's/@define-color RB0 .*/@define-color RB0 #ff2400;/' \
            -e 's/@define-color RB1 .*/@define-color RB1 #e81d1d;/' \
            -e 's/@define-color RB2 .*/@define-color RB2 #e8b71d;/' \
            -e 's/@define-color RB3 .*/@define-color RB3 #e3e81d;/' \
            -e 's/@define-color RB4 .*/@define-color RB4 #1de840;/' \
            -e 's/@define-color RB5 .*/@define-color RB5 #1ddde8;/' \
            -e 's/@define-color RB6 .*/@define-color RB6 #2b1de8;/' \
            -e 's/@define-color RB7 .*/@define-color RB7 #dd00f3;/' \
            "$STYLE_CSS"
        pkill -SIGUSR2 waybar
    }
    # ═══════════════════════════════════════════════
    # apply_wallust (Waybar + Wallust)
    # ═══════════════════════════════════════════════
    apply_wallust() {
        wallust run "$1" -s &
        sleep 1
        # Nur Ordner, neuesten zuerst
        DIR=$(command ls -1td ~/.cache/wallust/*/ | head -1 | xargs basename)
        THEME="$HOME/.cache/wallust/$DIR/FastResize_Salience_auto_SalienceDark"
        BG=$(grep -oP '"background": "\K[^"]+' "$THEME" || echo "#000000")
        FG=$(grep -oP '"foreground": "\K[^"]+' "$THEME" || echo "#FFFFFF")
        C0=$(grep -oP '"color0": "\K[^"]+' "$THEME" || echo "#FF0000")
        C1=$(grep -oP '"color1": "\K[^"]+' "$THEME" || echo "#FF0000")
        C2=$(grep -oP '"color2": "\K[^"]+' "$THEME" || echo "#00FF00")
        C3=$(grep -oP '"color3": "\K[^"]+' "$THEME" || echo "#FFFF00")
        C4=$(grep -oP '"color4": "\K[^"]+' "$THEME" || echo "#0000FF")
        C5=$(grep -oP '"color5": "\K[^"]+' "$THEME" || echo "#FF00FF")
        C6=$(grep -oP '"color6": "\K[^"]+' "$THEME" || echo "#00FFFF")
        # sed WaybarCava.sh
        sed -i \
            -e "s/^WallC0=.*/WallC0=\"${C0}\"/" \
            -e "s/^WallC1=.*/WallC1=\"${C1}\"/" \
            -e "s/^WallC2=.*/WallC2=\"${C2}\"/" \
            -e "s/^WallC3=.*/WallC3=\"${C3}\"/" \
            -e "s/^WallC4=.*/WallC4=\"${C4}\"/" \
            -e "s/^WallC5=.*/WallC5=\"${C5}\"/" \
            -e "s/^WallC6=.*/WallC6=\"${C6}\"/" \
            -e "s/^WallFG=.*/WallFG=\"${FG}\"/" \
            "$HOME/.config/waybar/scripts/WaybarCava.sh"
        # sed Style.css
        sed -i \
            -e "s/@define-color WallBlack .*/@define-color WallBlack ${BG};/" \
            -e "s/@define-color WallDarkestPurple .*/@define-color WallDarkestPurple ${C4};/" \
            -e "s/@define-color WallWeiss .*/@define-color WallWeiss ${FG};/" \
            -e "s/@define-color WallRot .*/@define-color WallRot ${C1};/" \
            -e "s/@define-color WallOrange .*/@define-color WallOrange ${C1};/" \
            -e "s/@define-color WallBrightOrange .*/@define-color WallBrightOrange ${C1};/" \
            -e "s/@define-color WallGrun .*/@define-color WallGrun ${C2};/" \
            -e "s/@define-color WallGelb .*/@define-color WallGelb ${C3};/" \
            -e "s/@define-color WallBrightestOrange .*/@define-color WallBrightestOrange ${C3};/" \
            -e "s/@define-color WallBlau .*/@define-color WallBlau ${C4};/" \
            -e "s/@define-color WallDarkPurple .*/@define-color WallDarkPurple ${C4};/" \
            -e "s/@define-color WallPurple .*/@define-color WallPurple ${C4};/" \
            -e "s/@define-color WallMagenta .*/@define-color WallMagenta ${C5};/" \
            -e "s/@define-color WallBrightPurple .*/@define-color WallBrightPurple ${C5};/" \
            -e "s/@define-color WallBrightestPurple .*/@define-color WallBrightestPurple ${C5};/" \
            -e "s/@define-color WallLila .*/@define-color WallLila ${C5};/" \
            -e "s/@define-color WallTurkis .*/@define-color WallTurkis ${C6};/" \
            -e "s/@define-color RB0 .*/@define-color RB0 ${C1};/" \
            -e "s/@define-color RB1 .*/@define-color RB1 ${C1};/" \
            -e "s/@define-color RB2 .*/@define-color RB2 ${C3};/" \
            -e "s/@define-color RB3 .*/@define-color RB3 ${C3};/" \
            -e "s/@define-color RB4 .*/@define-color RB4 ${C2};/" \
            -e "s/@define-color RB5 .*/@define-color RB5 ${C6};/" \
            -e "s/@define-color RB6 .*/@define-color RB6 ${C4};/" \
            -e "s/@define-color RB7 .*/@define-color RB7 ${C5};/" \
            "$STYLE_CSS"
        pkill -SIGUSR2 waybar
    }
    # ═══════════════════════════════════════════════
    # ImageMagick Effekte
    # ═══════════════════════════════════════════════
    declare -A effects=(
        ["No Effects"]="no-effects"
        ["Black & White"]="magick $wallpaper_current -colorspace gray -sigmoidal-contrast 10,40% $wallpaper_output"
        ["Blurred"]="magick $wallpaper_current -blur 0x10 $wallpaper_output"
        ["Charcoal"]="magick $wallpaper_current -charcoal 0x5 $wallpaper_output"
        ["Edge Detect"]="magick $wallpaper_current -edge 1 $wallpaper_output"
        ["Emboss"]="magick $wallpaper_current -emboss 0x5 $wallpaper_output"
        ["Frame Raised"]="magick $wallpaper_current +raise 150 $wallpaper_output"
        ["Frame Sunk"]="magick $wallpaper_current -raise 150 $wallpaper_output"
        ["Negate"]="magick $wallpaper_current -negate $wallpaper_output"
        ["Oil Paint"]="magick $wallpaper_current -paint 4 $wallpaper_output"
        ["Posterize"]="magick $wallpaper_current -posterize 4 $wallpaper_output"
        ["Polaroid"]="magick $wallpaper_current -polaroid 0 $wallpaper_output"
        ["Sepia Tone"]="magick $wallpaper_current -sepia-tone 65% $wallpaper_output"
        ["Solarize"]="magick $wallpaper_current -solarize 80% $wallpaper_output"
        ["Sharpen"]="magick $wallpaper_current -sharpen 0x5 $wallpaper_output"
        ["Vignette"]="magick $wallpaper_current -vignette 0x3 $wallpaper_output"
        ["Vignette-black"]="magick $wallpaper_current -background black -vignette 0x3 $wallpaper_output"
        ["Zoomed"]="magick $wallpaper_current -gravity Center -extent 1:1 $wallpaper_output"
    )
    # ═══════════════════════════════════════════════
    # Keine Effekte (Original)
    # ═══════════════════════════════════════════════
    no-effects() {
        awww img -o "$focused_monitor" \
            --transition-type "$TRANSITION" \
            --transition-duration "$DURATION" \
            --transition-fps "$FPS" \
            --transition-bezier "$BEZIER" \
            --transition-angle "$ANGLE" \
            "$wallpaper_current"
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga &
        restore_original
        echo "No Effects" > "$CURRENT_EFFECT"
        notify-send -u low -i "dialog-information" "Wallpaper" "Original"
    }
    # ═══════════════════════════════════════════════
    # Rofi Menü
    # ═══════════════════════════════════════════════
    pidof rofi > /dev/null && pkill rofi
    current=$(cat "$CURRENT_EFFECT" 2>/dev/null || echo "No Effects")
    if [[ -z "${effects[$current]}" ]]; then
        current="No Effects"
    fi
    IFS=$'\n' sorted_options=($(printf "%s\n" "${!effects[@]}" | sort))
    unset IFS
    for effect in "${sorted_options[@]}"; do
        if [[ "$effect" == "$current" ]]; then
            printf '\0%s\x1fselected\n' "$effect"
        else
            echo "$effect"
        fi
        done | rofi -dmenu -i -p "" \
            -theme-str 'entry {enabled: false;}' \
            -theme-str 'element-text {horizontal-align: 0.5;}' \
            -theme-str 'listview {cycle: false;}' \
            -theme-str 'element selected {background-color: #2CFF05; text-color: #2323FF;}' \
            -theme-str 'element selected.normal {background-color: #2CFF05; text-color: #2323FF;}' \
            -theme-str 'element selected.urgent {background-color: #2CFF05; text-color: #2323FF;}' \
            -theme-str 'element selected.active {background-color: #2323FF; text-color: #2CFF05;}' \
        | {
        read -r choice
        if [[ -n "$choice" ]]; then
            if [[ "$choice" == "No Effects" ]]; then
                no-effects
            else
                notify-send -u normal -i "dialog-information" "Wallpaper" "$choice wird angewendet..."
                rm -f "$wallpaper_output"
                eval "${effects[$choice]}"
                sleep 0.3
                awww img -o "$focused_monitor" \
                    --transition-type "$TRANSITION" \
                    --transition-duration "$DURATION" \
                    --transition-fps "$FPS" \
                    --transition-bezier "$BEZIER" \
                    --transition-angle "$ANGLE" \
                    "$wallpaper_output"
                paplay /usr/share/sounds/freedesktop/stereo/complete.oga &
                apply_wallust "$wallpaper_output"
                echo "$choice" > "$CURRENT_EFFECT"
                notify-send -u low -i "dialog-ok" "Wallpaper" "$choice angewendet"
            fi
        fi
    }
#
#
#