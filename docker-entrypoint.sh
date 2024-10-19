#!/bin/bash

set -e -x

quake_cmd='./quake.x11 -debug -condebug -mem 256 -zone 2048 -dedicated 16 -port 26000 -noipx -game frikbot +map dm6 +sv_aim 1 +saved1 1 +skill 0 +sys_ticrate 0.05'

# uncomment this when hacking
# ${quake_cmd}

# comment these two when hacking
screen -a -A -S session -d -m bash -c "${quake_cmd} ; pkill -9 -f gotty"
./gotty \
    --address 0.0.0.0 \
    --port 7072 \
    --ws-origin '.*' \
    --permit-write \
    --reconnect \
    --reconnect-time -1 \
    screen -a -A -x session
