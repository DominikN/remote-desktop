#!/bin/bash

# nohup x11vnc -passwd "qwerty123" -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop >/dev/null 2>&1 &
nohup x11vnc -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop >/dev/null 2>&1 &
/usr/share/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_SERVER_PORT}

