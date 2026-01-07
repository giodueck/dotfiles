#!/bin/sh

BUSY_P=$(cat /sys/class/drm/card1/device/gpu_busy_percent | sed 's/\n//')

VRAM_USED=$(($(cat /sys/class/drm/card1/device/mem_info_vram_used)/1024/1024))
VRAM_TOTAL=$(($(cat /sys/class/drm/card1/device/mem_info_vram_total)/1024/1024))

VRAM_P=$(bc <<< "scale=2; $({ cat /sys/class/drm/card1/device/mem_info_vram_used; echo -n '/ '; cat /sys/class/drm/card1/device/mem_info_vram_total; } | xargs) * 100" | sed "s/.00//" | sed 's/\n//')

echo '{"percentage":'$BUSY_P',"text":"'$BUSY_P'","alt":"'$VRAM_P'","tooltip":"'$BUSY_P'% '$VRAM_USED'MB/'$VRAM_TOTAL'MB"}'
