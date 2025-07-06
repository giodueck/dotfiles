#!/bin/bash

eww open wallpaper-clock --screen 0 --id primary
[ $(hyprctl monitors | grep -e '^M' | wc -l) -ge 2 ] && eww open wallpaper-clock --screen 1 --id secondary
