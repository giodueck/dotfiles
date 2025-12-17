#!/bin/sh

handle() {
  case $1 in
    monitoradded*) sh ~/.config/hypr/scripts/eww-open-all.sh ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
