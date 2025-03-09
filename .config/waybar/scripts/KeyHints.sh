#
#
#
#        ,--.                            ,--,
#    ,--/  /|                          ,--.'|                         ___
# ,---,': / '                       ,--,  | :  ,--,                 ,--.'|_
# :   : '/ /                     ,---.'|  : ',--.'|         ,---,   |  | :,'
# |   '   ,                      |   | : _' ||  |,      ,-+-. /  |  :  : ' :  .--.--.
# '   |  /      ,---.       .--, :   : |.'  |`--'_     ,--.'|'   |.;__,'  /  /  /    '
# |   ;  ;     /     \    /_ ./| |   ' '  ; :,' ,'|   |   |  ,"' ||  |   |  |  :  /`./
# :   '   \   /    /  |, ' , ' : '   |  .'. |'  | |   |   | /  | |:__,'| :  |  :  ;_
# |   |    ' .    ' / /___/ \: | |   | :  | '|  | :   |   | |  | |  '  : |__ \  \    `.
# '   : |.  \'   ;   /|.  \  ' | '   : |  : ;'  : |__ |   | |  |/   |  | '.'| `----.   \
# |   | '_\.''   |  / | \  ;   : |   | '  ,/ |  | '.'||   | |--'    ;  :    ;/  /`--'  /
# '   : |    |   :    |  \  \  ; ;   : ;--'  ;  :    ;|   |/        |  ,   /'--'.     /
# ;   |,'     \   \  /    :  \  \|   ,/      |  ,   / '---'          ---`-'   `--'---'
# '---'        `----'      \  ' ;'---'        ---`-'
#                           `--`
#
#!/bin/bash
  # GDK BACKEND. Change to either wayland or x11 if having issues
  BACKEND=wayland

  # Check if rofi or yad is running and kill them if they are
  if pidof rofi > /dev/null; then
    pkill rofi
  fi

  if pidof yad > /dev/null; then
    pkill yad
  fi

  # Launch yad with calculated width and height
  GDK_BACKEND=$BACKEND yad \
      --center \
      --title="KooL Quick Cheat Sheet" \
      --no-buttons \
      --list \
      --column=Key: \
      --column=Command: \
      --timeout-indicator=bottom \
      "ESC" "   close this app" \
      " = " "SUPER KEY = Windows Key Button" \
      " + F" "fullscreen" \
      " + M" "minifullscreen" \
      " + T" "togglefloating" \
      "ALT + F4" "killactive process" \
      " + R" "exec hyprctl reload" \
      " + L" "exec hyprlock" \
      " + RETURN" "exec kitty" \
      " + SPACE" "exec pkill rofi || rofi -show drun -replace -i" \
      "" "" \
      "~WINDOW~" "~CHANGE~" \
      " + leftmouse" "movewindow" \
      " + rightmouse" "resizewindow" \
      "" "" \
      "~ZOOM~" "~IN/OUT~" \
      " + ALT + mouse_down" "exec hyprctl keyword cursor:zoom_factor(out)" \
      " + ALT + mouse_up" "exec hyprctl keyword cursor:zoom_factor(in)" \
      "" "" \
      "~WORKSPACE~" "~CREATE/CLOSE~" \
      " + A" "workspace +1" \
      " + SHIFT + A" "workspace -1" \
      "" "" \
      "~WORKSPACE~" "~FOCUSNEXT/FOCUSRESENT~" \
      " + Tab" "workspace m+1" \
      " + SHIFT + Tab" "workspace m-1" \
      "" "" \
      "~WINDOWS~" "~FOCUS/RESENTFOCUS~" \
      "ALT + Tab" "focuswindow +1" \
      "ALT + SHIFT + Tab" "focuswindow -1" \
      "" "" \
      "~WORKSPACE~" "~FOCUSNEXT/FOCUSRESENT~" \
      " + mouse_down" "workspace e+1" \
      " + mouse_up" "workspace e-1" \
      "" "" \
      "~WORKSPACE~" "~MINIMISE ALL~" \
      " + CTRL + down" "workspace empty" \
      "" "" \
      "~ALIAS~" "~GENERAL~" \
      "v" "nvim" \
      "s" "subl" \
      "f" "fastfetch" \
      "k" "kitty +kitten icat" \
      "c" "clear" \
      "ex" "exit" \
      "sd" "systemctl poweroff" \
      "sys" "sudo pacman -Syyu" \
      "fp" "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}" \
      "vf" "v $(fp)" \
      "visual" "$VISUAL" \
      "editor" "$EDITOR" \
      "term" "$TERM" \
      "shell" "$SHELL" \
      "cleanup" "~/.config/waybar/scripts/Clean.sh" \
      "" "" \
      "~ALIAS~" "~LS~" \
      "l" "lsblk" \
      "ls" "eza -a --icons=always" \
      "ll" "eza -al --icons=always" \
      "lt" "eza -a --tree --level=1 --icons=always" \
      "lastmod" "find . -type f -not -path "*/\.*" -exec ls -lrt {} +" \
      "" "" \
      "~ALIAS~" "~CD~" \
      ".." "cd .." \
      "conf" "cd $HOME/tomaking/.config/" \
      "down" "cd $HOME/tomaking/Download/" \
      "" "" \
      "~ALIAS~" "~GIT~" \
      "gs" "git status" \
      "ga" "git add" \
      "gc" "git commit -m" \
      "gp" "git push" \
      "gpl" "git pull" \
      "gst" "git stash" \
      "gsp" "git stash; git pull" \
      "gfo" "git fetch origin" \
      "gcheck" "git checkout" \
      "gcredential" "git config credential.helper store" \
#
#
#