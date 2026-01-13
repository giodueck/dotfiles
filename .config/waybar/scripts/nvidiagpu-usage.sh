#!/bin/bash

BUSY_P=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,nounits,noheader)

VRAM_USED=$(($(nvidia-smi --query-gpu=memory.used --format=csv,nounits,noheader )))
VRAM_TOTAL=$(($(nvidia-smi --query-gpu=memory.total --format=csv,nounits,noheader )))

VRAM_P=$(bc <<< "scale=2; $(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,nounits,noheader | sed 's/,/ \//') * 100" | sed "s/.00//" | sed 's/\n//')

NAME=$(nvidia-smi --query-gpu=name --format=noheader)

echo '{"percentage":'$BUSY_P',"text":"'$BUSY_P'","alt":"'$VRAM_P'","tooltip":"'$NAME'\r'$BUSY_P'% '$VRAM_USED'MB/'$VRAM_TOTAL'MB"}'
