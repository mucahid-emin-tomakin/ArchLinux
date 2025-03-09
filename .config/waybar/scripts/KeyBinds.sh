#
#
#
#        ,--.
#    ,--/  /|                        ,---,
# ,---,': / '                      ,'  .'  \  ,--,                     ,---,
# :   : '/ /                     ,---.' .' |,--.'|         ,---,     ,---.'|
# |   '   ,                      |   |  |: ||  |,      ,-+-. /  |    |   | :  .--.--.
# '   |  /      ,---.       .--, :   :  :  /`--'_     ,--.'|'   |    |   | | /  /    '
# |   ;  ;     /     \    /_ ./| :   |    ; ,' ,'|   |   |  ,"' |  ,--.__| ||  :  /`./
# :   '   \   /    /  |, ' , ' : |   :     \'  | |   |   | /  | | /   ,'   ||  :  ;_
# |   |    ' .    ' / /___/ \: | |   |   . ||  | :   |   | |  | |.   '  /  | \  \    `.
# '   : |.  \'   ;   /|.  \  ' | '   :  '; |'  : |__ |   | |  |/ '   ; |:  |  `----.   \
# |   | '_\.''   |  / | \  ;   : |   |  | ; |  | '.'||   | |--'  |   | '/  ' /  /`--'  /
# '   : |    |   :    |  \  \  ; |   :   /  ;  :    ;|   |/      |   :    :|'--'.     /
# ;   |,'     \   \  /    :  \  \|   | ,'   |  ,   / '---'        \   \  /    `--'---'
# '---'        `----'      \  ' ;`----'      ---`-'                `----'
#                           `--`
#
#!/bin/bash
    # Searchable enabled keybinds using rofi
    # Kill yad to not interfere with this binds
    pkill yad || true

    # Define the config files
    KEYBINDS="$HOME/.config/hypr/keybindings.conf"

    # check for any keybinds to display
    if [[ -z "$KEYBINDS" ]]; then
        echo "No keybinds found."
        exit 1
    fi

    # Use rofi to display the keybinds
    echo "$KEYBINDS" | rofi -dmenu -i -p "Keybinds" -config ~/.config/rofi/keybinds.rasi
#
#
#