#!/bin/bash

{
    echo '{'
    echo '    "cpu": {'
    echo '        "interval": 2,'

    echo -n '        "format":" '
    for i in $(lscpu -p=CPU | grep -E '^[^\#]'); do
        echo -n "{icon$i}"
    done
    echo '",'

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
    echo '    },'

    echo '    "temperature": {'
    echo '        // "thermal-zone": 2,'
    # Prefer Tccd temperature, but settle for Tctl if not available
    if [ -f "/sys/class/hwmon/hwmon2/temp3_input" ]; then
        echo '        "hwmon-path": "/sys/class/hwmon/hwmon2/temp3_input",'
    else
        echo '        "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",'
    fi
    echo '        "warning-threshold": 80,'
    echo '        "critical-threshold": 90,'
    echo '        "format": "{icon} {temperatureC} ",'
    echo '        "format-icons": ["", "", ""]'
    echo '    }'

    echo '}'
} > ~/.config/waybar/cpu.jsonc
