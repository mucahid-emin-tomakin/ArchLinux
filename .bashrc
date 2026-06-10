#
#
#
# ██████╗  █████╗ ███████╗██╗  ██╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║
# ██████╔╝███████║███████╗███████║
# ██╔══██╗██╔══██║╚════██║██╔══██║
# ██████╔╝██║  ██║███████║██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ ~/.bashrc ~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~ Pfadkonfiguration ~~~~~~~~~~~~~~~~~~~~~~~~
#
    # Prompt mit Benutzer, Hostname, Verzeichnis & Git-Branch
    export PS1="${GREEN}\u${WHITE}@${CYAN}\h ${YELLOW}\w${MAGENTA} \$(parse_git_branch) ${WHITE}\$ ${RESET}"
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Farben definieren ~~~~~~~~~~~~~~~~~~~~~~~~
#
    # Definieren Farbvariablen für die Verwendung im Terminal
    BLACK='\[\e[0;30m\]'        # Dunkel Schwarz    
    RED='\[\e[0;31m\]'          # Dunkel Rot
    GREEN='\[\e[0;32m\]'        # Dunkel Grün
    YELLOW='\[\e[0;33m\]'       # Dunkel Gelb
    BLUE='\[\e[0;34m\]'         # Dunkel Blau
    MAGENTA='\[\e[0;35m\]'      # Dunkel Magenta
    CYAN='\[\e[0;36m\]'         # Dunkel Cyan
    WHITE='\[\e[0;37m\]'        # Dunkel Weiß
    ORANGE='\[\e[38;5;214m\]'   # Orange (aus der 256-Farbpalette)
    RESET='\[\e[0m\]'           # Reset (zurücksetzen der Farben)
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~
# Setzt Standard-Editoren und Programme für verschiedene Aufgaben
#
    export SHELL=bash
    export TERM=kitty
    export PAGER=bat
    export VISUAL=nvim
    export EDITOR=subl
    export BROWSER="/usr/bin/google-chrome-stable"
    export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
        # sorgt dafür, dass der Git-Branch korrekt angezeigt wird
        parse_git_branch() {
          git branch 2>/dev/null | grep '*' | sed 's/* //'
        }
#
# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~
# Konfiguriert die Historie der Bash-Shell, um die Anzahl der gespeicherten Befehle auf 25.000 zu erhöhen und unnötige Einträge wie Befehle, die mit einem Leerzeichen beginnen, zu ignorieren
#
    export HISTFILE=~/.histfile
    export HISTSIZE=25000
    export SAVEHIST=25000
    export HISTCONTROL=ignorespace
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Terminal ~~~~~~~~~~~~~~~~~~~~~~~~
#
    TERMINAL_WIDTH=$(tput cols)
    TERMINAL_HEIGHT=$(tput lines)
    # Öffnet Fastfetch ohne animation
    if [[ "$SKIP_ANIMATION" == "1" ]]; then
        unset SKIP_ANIMATION
        if [[ $TERMINAL_WIDTH -gt 211 && $TERMINAL_HEIGHT -gt 50 ]]; then
            fastfetch --config /home/tomaking/.config/fastfetch/config.jsonc
        elif [[ $TERMINAL_WIDTH -gt 104 && $TERMINAL_WIDTH -lt 106 && $TERMINAL_HEIGHT -gt 24 ]]; then
            fastfetch --config /home/tomaking/.config/fastfetch/configII.jsonc
        elif [[ $TERMINAL_WIDTH -gt 50 && $TERMINAL_WIDTH -lt 53 && $TERMINAL_HEIGHT -gt 24 && $TERMINAL_HEIGHT -lt 27 ]]; then
            fastfetch --config ~/.config/fastfetch/configIII.jsonc
        else
            pkill fastfetch
        fi
    # Prüfen, ob das Terminal größer als 211x50 ist
    else
        if [[ $TERMINAL_WIDTH -gt 211 && $TERMINAL_HEIGHT -gt 50 ]]; then
            /home/tomaking/.config/fastfetch/AsciiArt.sh
        elif [[ $TERMINAL_WIDTH -gt 104 && $TERMINAL_WIDTH -lt 106 && $TERMINAL_HEIGHT -gt 50 ]]; then
            /home/tomaking/.config/fastfetch/AsciiArtII.sh
        elif [[ $TERMINAL_WIDTH -gt 104 && $TERMINAL_WIDTH -lt 106 && $TERMINAL_HEIGHT -gt 24 && $TERMINAL_HEIGHT -lt 27 ]]; then
            /home/tomaking/.config/fastfetch/AsciiArtIII.sh
        elif [[ $TERMINAL_WIDTH -gt 50 && $TERMINAL_WIDTH -lt 53 && $TERMINAL_HEIGHT -gt 24 && $TERMINAL_HEIGHT -lt 27 ]]; then
            fastfetch --config ~/.config/fastfetch/configIII.jsonc
        else
            pkill fastfetch
        fi
    fi
#
    # Überprüft, ob die Shell im interaktiven Modus läuft. Falls nicht, wird das Skript abgebrochen und keine weiteren Befehle ausgeführt.
    [[ $- != *i* ]] && return
    # Stellt den Modus auf Neovim um, sodass die Bash wie der Vi-Editor funktioniert
    set -o vi
    # Bindet die Tastenkombination Ctrl+l an den Befehl clear, um den Bildschirm zu löschen
    bind -x '"\C-l":clear'
    # Aktiviert History-Suche mit fzf Ctrl + R
    bind "'"'"\C-r": "fzf-history-widget"\n'"'"
    # Sorgt dafür, dass Bash-Completion geladen wird um Tab zu verwenden
    source /usr/share/bash-completion/bash_completion
    # Diese Zeile initialisiert Starship für Bash und ersetzt deinen Standard-Prompt
    eval "$(starship init bash)"
    # Um einen Ordner zu betreten, indem du einfach seinen Namen eintippst, ohne cd explizit zu verwenden
    shopt -s autocd
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Alias ~~~~~~~~~~~~~~~~~~~~~~~~
# alias definiert Kurzbefehle für längere oder häufiger verwendete Befehle
#
    # General
    alias c='clear'
    alias ex='exit'
    alias sys='sudo pacman -Syyu'
    alias spo='systemctl poweroff'
    alias srb='systemctl reboot'
    alias visual='$VISUAL'
    alias editor='$EDITOR'
    alias term='$TERM'
    alias shell='$SHELL'
    alias cleanup='~/.config/waybar/scripts/Clean.sh'
    # ricing
    #alias sbr='cd $HOME/tomaking/.config/nvim/ &&v $HOME/tomaking/.bashrc'
    # ls
    alias l='lsblk'
    alias ls='eza -a --icons=always'
    alias ll='eza -al --icons=always'
    alias lt='eza -a --tree --level=1 --icons=always'
    alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +' # Sucht Dateien (außer versteckte Dateien) und listet sie
    # Neovim
    alias v=nvim
    # Sublime Text
    alias s=subl
    # FastFetch
    alias f='fastfetch'
    # Kitty
    alias k='kitty +kitten icat'
    # cd
    alias ..="cd .."
    alias conf='cd $HOME/tomaking/.config/'
    alias down='cd $HOME/tomaking/Download/'
    # git
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit -m"
    alias gp="git push"
    alias gpl="git pull"
    alias gst="git stash"
    alias gsp="git stash; git pull"
    alias gfo="git fetch origin"
    alias gcheck="git checkout"
    alias gcredential="git config credential.helper store"
    # fzf aliases
    alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'" # Sucht mit fp, Vorschau mit bat
    alias vf='v $(fp)' # Mit vf eine Datei aus der Suche öffnet
    # Hyprland
    alias hyprland='Hyprland --quiet'
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Bash-Autovervollständigung ~~~~~~~~~~~~~~~~~~~~~~~~
# Schlägt mögliche Optionen und Parameter vor, während man den Befehl tippst
#
    # dotnet
    function _dotnet_bash_complete() {
      local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
      local candidates
      read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)
      read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
    }
    complete -f -F _dotnet_bash_complete dotnet
#
#
#