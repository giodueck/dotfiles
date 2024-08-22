#!/bin/bash

{
    echo '{'
    echo '    "cpu": {'
    echo '        "interval": 2,'

    echo -n '        "format":" '
    for i in $(lscpu -p=CPU | grep -E '^[^\#]'); do
        echo -n "{icon$i}"
    done
    echo ' {usage:>3}%",'

    echo '        "format-icons": ['
    echo '            "<span color='\''#69ff94'\''>▁</span>", // green'
    echo '            "<span color='\''#2aa9ff'\''>▂</span>", // blue'
    echo '            "<span color='\''#f8f8f2'\''>▃</span>", // white'
    echo '            "<span color='\''#f8f8f2'\''>▄</span>", // white'
    echo '            "<span color='\''#ffffa5'\''>▅</span>", // yellow'
    echo '            "<span color='\''#ffffa5'\''>▆</span>", // yellow'
    echo '            "<span color='\''#ff9977'\''>▇</span>", // orange'
    echo '            "<span color='\''#dd532e'\''>█</span>"  // red'
    echo '        ]'
    echo '    }'
    echo '}'
} > ~/.config/waybar/cpu.jsonc
