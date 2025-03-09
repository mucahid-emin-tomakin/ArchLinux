#
#
#
#     ,---,.                               ,---,
#   ,'  .'  \                            ,--.' |
# ,---.' .' |                            |  |  :       __  ,-.
# |   |  |: |                 .--.--.    :  :  :     ,' ,'/ /|
# :   :  :  /    ,--.--.     /  /    '   :  |  |,--. '  | |' |    ,---.
# :   |    ;    /       \   |  :  /`./   |  :  '   | |  |   ,'   /     \
# |   :     \  .--.  .-. |  |  :  ;_     |  |   /' : '  :  /    /    / '
# |   |   . |   \__\/: . .   \  \    `.  '  :  | | | |  | '    .    ' /
# '   :  '; |   ," .--.; |    `----.   \ |  |  ' | : ;  : |    '   ; :__
# |   |  | ;   /  /  ,.  |   /  /`--'  / |  :  :_:,' |  , ;    '   | '.'|
# |   :   /   ;  :   .'   \ '--'.     /  |  | ,'      ---'     |   :    :
# |   | ,'    |  ,     .-./   `--'---'   `--''                  \   \  /
# `----'       `--`---'                                          `----'
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ ~/.bashrc ~~~~~~~~~~~~~~~~~~~~~~~~
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Pfadkonfiguration ~~~~~~~~~~~~~~~~~~~~~~~~
#
    # Prompt mit Benutzer, Hostname, Verzeichnis & Git-Branch
    export PS1="${GREEN}\u${WHITE}@${CYAN}\h ${YELLOW}\w${MAGENTA} \$(parse_git_branch) ${WHITE}\$ ${RESET}"
    # Steuert das Aussehen deines Shell-Prompts (die Eingabeaufforderung)
    #PS1="${GREEN}\u${RESET}@${CYAN}\h ${YELLOW}\w${RESET} \$(parse_git_branch) ${WHITE}\$ "
    #PS1='[\u@\h \W]\$ '
    #PS1="${GREEN}\u${RESET}@${CYAN}\h ${YELLOW}\w${RESET} $ "
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Farben definieren ~~~~~~~~~~~~~~~~~~~~~~~~
#
    # Definieren Farbvariablen für die Verwendung im Terminal
    BLACK='\[\e[0;30m\]'        # Dunkel Schwarz    
    RED='\[\e[0;31m\]'          # Dunkel Rot        #RED='\[\e[1;31m\]'
    GREEN='\[\e[0;32m\]'        # Dunkel Grün       #GREEN='\[\e[1;32m\]'
    YELLOW='\[\e[0;33m\]'       # Dunkel Gelb       #YELLOW='\[\e[1;33m\]'
    BLUE='\[\e[0;34m\]'         # Dunkel Blau       #BLUE='\[\e[1;34m\]'
    MAGENTA='\[\e[0;35m\]'      # Dunkel Magenta    #MAGENTA='\[\e[1;35m\]'
    CYAN='\[\e[0;36m\]'         # Dunkel Cyan       #CYAN='\[\e[1;36m\]'
    WHITE='\[\e[0;37m\]'        # Dunkel Weiß       #WHITE='\[\e[1;37m\]'
    ORANGE='\[\e[38;5;214m\]'   # Orange (aus der 256-Farbpalette)
    RESET='\[\e[0m\]'           # Reset (zurücksetzen der Farben)
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~
# Setzt Standard-Editoren und Programme für verschiedene Aufgaben
#
    export SHELL=bash
    export TERM=kitty
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
# ~~~~~~~~~~~~~~~~~~~~~~~~ SSH-Agenten ~~~~~~~~~~~~~~~~~~~~~~~~
# Startet einen SSH-Agenten, falls dieser nicht bereits läuft, und stellt sicher, dass der SSH-Agent richtig geladen wird
#
    # SSH Script von der Arch wiki
    #if ! pgrep -u "$USER" ssh-agent >/dev/null; then
      #ssh-agent >"$XDG_RUNTIME_DIR/ssh-agent.env"
    #fi
    #if [[ ! "$SSH_AUTH_SOCK" ]]; then
      #source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
    #fi
    # Fügt automatisch verschiedene SSH-Schlüssel dem SSH-Agenten hinzu
    #ssh-add -q ~/.ssh/id_ed25519
    #ssh-add -q ~/.ssh/vanoord
    #ssh-add -q ~/.ssh/delegate
#
# ~~~~~~~~~~~~~~~~~~~~~~~~ Terminal ~~~~~~~~~~~~~~~~~~~~~~~~
#
    TERMINAL_WIDTH=$(tput cols)
    TERMINAL_HEIGHT=$(tput lines)
    # Prüfen, ob das Terminal größer als 211x50 ist
    if [[ $TERMINAL_WIDTH -gt 211 && $TERMINAL_HEIGHT -gt 50 ]]; then
        /home/tomaking/.config/fastfetch/ottoman.sh
    elif [[ $TERMINAL_WIDTH -gt 104 && $TERMINAL_WIDTH -lt 106 && $TERMINAL_HEIGHT -gt 50 ]]; then
        /home/tomaking/.config/fastfetch/animationIII.sh
    elif [[ $TERMINAL_WIDTH -gt 104 && $TERMINAL_WIDTH -lt 106 && $TERMINAL_HEIGHT -gt 24 && $TERMINAL_HEIGHT -lt 27 ]]; then
        /home/tomaking/.config/fastfetch/animation.sh
    elif [[ $TERMINAL_WIDTH -gt 50 && $TERMINAL_WIDTH -lt 53 && $TERMINAL_HEIGHT -gt 24 && $TERMINAL_HEIGHT -lt 27 ]]; then
        fastfetch --config ~/.config/fastfetch/configII.jsonc
    else
        pkill fastfetch
    fi
    # Nur beim ersten Öffnen eines neuen Terminals Shell ausführen
    #if [[ ! -v TERMINAL_STARTED ]]; then
        #/home/tomaking/.config/fastfetch/animationII.sh
        ##export TERMINAL_STARTED=true
    #else
        #/home/tomaking/.config/fastfetch/animationII.sh
    #fi
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
    alias sd='systemctl poweroff'
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
