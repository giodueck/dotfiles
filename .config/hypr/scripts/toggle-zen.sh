#!/bin/bash

ZEN_MODE_FILE=/tmp/zen_active

if [[ -f $ZEN_MODE_FILE ]]; then
    rm $ZEN_MODE_FILE
    hyprctl reload
else
    touch $ZEN_MODE_FILE
    hyprctl eval "hl.config({general={border_size=0,gaps_in=0,gaps_out=0},animations={enabled=false},decoration={rounding=0,inactive_opacity=1}})"
fi
