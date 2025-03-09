#
#
#
#   _                     _                _                                   _
#  | |                   | |              | |                                 | |
#  | |__     __ _   ___  | |__            | |   ___     __ _    ___    _   _  | |_
#  | '_ \   / _` | / __| | '_ \           | |  / _ \   / _` |  / _ \  | | | | | __|
#  | |_) | | (_| | \__ \ | | | |          | | | (_) | | (_| | | (_) | | |_| | | |_
#  |_.__/   \__,_| |___/ |_| |_|          |_|  \___/   \__, |  \___/   \__,_|  \__|
#                                 ______                __/ |
#                                |______|              |___/
#
# ~/.bash_logout: wird von bash(1) ausgeführt, wenn die Login-Shell beendet wird.
# Folgende nur bei der letzten Bash-Sitzung – das TTY, das PS, das Grep und das WC ;)
    #if [ "$(ps -u $USER | grep bash | wc -l)" = "2" ]; then
        # see hidden files
        #shopt -s dotglob
#
        #[ -x $LOCAL_BIN/limactl ] && $LOCAL_BIN/limactl stop colima -f
#
        # when leaving the console, clear the screen to increase privacy
        #[ -x /usr/bin/clear ] && /usr/bin/clear -q
#
        # remove all SSH keys
        #/usr/bin/ssh-add -D >/dev/null 2>&1
        #/usr/bin/ssh-agent -k >/dev/null 2>&1
        #unset SSH_AUTH_SOCK
        #unset SSH_AGENT_PID
#
        #:>~/.lesshst
        #[ -f ~/.mysql_history ] && :>~/.mysql_history
#
        # clear vim history
        #rm -rf ~/.vim/backup/*
        #rm -rf ~/.vim/backup/.??*
        #[ -d ~/.vim6 ] && rm -rf ~/.vim6/backup/*
        #rm -rf ~/.vim6/backup/.??*
        #:>~/.viminfo
#
        # clear bash history
        #:>~/.bash_history
        #history -c
    #fi
#
#
#
