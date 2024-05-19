#!/bin/bash

set -e

screen -a -A -S session -d -m bash -c './quake.x11 -mem 256 -zone 2048 -dedicated 16 -port 26000 -noipx -game frikbot +map dm6 +sv_aim 1 +saved1 1 +skill 0 +sys_ticrate 0.05 ; pkill -9 -f gotty'

./gotty \
    --address 0.0.0.0 \
    --port 7072 \
    --ws-origin '.*' \
    --permit-write \
    --reconnect \
    --reconnect-time -1 \
    screen -a -A -x session
