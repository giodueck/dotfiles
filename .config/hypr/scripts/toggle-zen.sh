#!/bin/bash

ZEN_MODE_FILE=/tmp/zen_active

# TODO: use hyprctl getoption to reset the same options later. Hardcode is easier though

if [[ -f $ZEN_MODE_FILE ]]; then
    rm $ZEN_MODE_FILE
    hyprctl keyword general:border_size 2
    hyprctl keyword general:gaps_in 4
    hyprctl keyword general:gaps_out 2
else
    touch $ZEN_MODE_FILE
    hyprctl keyword general:border_size 0
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
fi
