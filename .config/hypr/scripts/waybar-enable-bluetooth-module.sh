#!/bin/bash

if [ -z "$(bluetoothctl list)" ]; then
    sed -i 's/^[^\/]*[ ]*"bluetooth",/\/\/&/' ~/.config/waybar/config.jsonc
else
    sed -i 's/^[\/]*\([ ]*"bluetooth",\)/\1/' ~/.config/waybar/config.jsonc
fi
