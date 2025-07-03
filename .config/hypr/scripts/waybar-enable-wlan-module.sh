#!/bin/bash

WLAN_LIST=$(ip a | grep wlan)
if [ -z "$WLAN_LIST" ]; then
    sed -i 's/^[^\/]*[ ]*"network#wlan0",/\/\/&/' ~/.config/waybar/config.jsonc
else
    sed -i 's/^[\/]*\([ ]*"network#wlan0",\)/\1/' ~/.config/waybar/config.jsonc
fi
