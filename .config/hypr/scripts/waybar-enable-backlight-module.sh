#!/bin/bash

if ! brightnessctl; then
    sed -i 's/^[^\/]*[ ]*"backlight",/\/\/&/' ~/.config/waybar/config.jsonc
else
    sed -i 's/^[\/]*\([ ]*"backlight",\)/\1/' ~/.config/waybar/config.jsonc
fi
