#!/bin/bash

BL_LIST=$(timeout 2 bluetoothctl list)
if [ -z "$BL_LIST" ]; then
    sed -i 's/^[^\/]*[ ]*"bluetooth",/\/\/&/' ~/.config/waybar/config.jsonc
else
    sed -i 's/^[\/]*\([ ]*"bluetooth",\)/\1/' ~/.config/waybar/config.jsonc
fi
