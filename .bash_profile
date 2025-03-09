#
#
#
#   _                     _                                        __   _   _
#  | |                   | |                                      / _| (_) | |
#  | |__     __ _   ___  | |__             _ __    _ __    ___   | |_   _  | |   ___
#  | '_ \   / _` | / __| | '_ \           | '_ \  | '__|  / _ \  |  _| | | | |  / _ \
#  | |_) | | (_| | \__ \ | | | |          | |_) | | |    | (_) | | |   | | | | |  __/
#  |_.__/   \__,_| |___/ |_| |_|          | .__/  |_|     \___/  |_|   |_| |_|  \___|
#                                 ______  | |
#                                |______| |_|
#
# ~/.bash_profile
#
    #if [[ -f ~/.bashrc ]]; then
        #source ~/.bashrc
    #fi
#
    # Fastfetch nur beim ersten Mal nach dem Login ausführen
    #if [ ! -f /tmp/first_terminal.lock ]; then
        #fastfetch | lolcat
        #touch /tmp/first_terminal.lock  # Sperrdatei erstellen, um erneute Ausführung zu verhindern
    #fi
#
    #[[ -f ~/.bashrc ]] && . ~/.bashrc
#
    #if [[ $(tty) == /dev/tty1 ]]; then
        #fastfetch | lolcat
    #fi
#
    #if [[ -z $DISPLAY ]]; then
        #fastfetch | lolcat
    #fi
#
    #if [[ $(tty) == /dev/tty1 ]]; then
        #fastfetch | lolcat
        #exec Hyprland
    #fi
#
    #if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
        #exec Hyprland
    #fi
#
    #if [[ -z $DISPLAY ]] && [[ $(tty) =~ /dev/tty[1-6] ]]; then
        #fastfetch | lolcat
        #exec Hyprland
    #fi
#
    if [[ -z $DISPLAY ]] && [[ $(tty) =~ /dev/tty1 ]]; then
        fastfetch | lolcat
        exec Hyprland
    fi
#
    if [[ -z $DISPLAY ]] && [[ $(tty) =~ /dev/tty[2-6] ]]; then
        fastfetch | lolcat
    fi
#
#
#
