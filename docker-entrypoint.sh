#!/bin/bash

set -e

screen -a -A -S session -d -m bash -c './quake.x11 -dedicated 64 -port 26000 -noipx -debug -condebug -verbose -game frikbot +map dm6 +sv_aim 2 +saved1 1 +skill 0'

./gotty \
    --address 0.0.0.0 \
    --ws-origin '.*' \
    --permit-write \
    --reconnect \
    --reconnect-time -1 \
    screen -a -A -x session
