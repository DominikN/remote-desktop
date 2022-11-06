#!/bin/bash

mkdir /root/.vnc
x11vnc -storepasswd ${VNC_PASSWORD} /root/.vnc/passwd

# nohup x11vnc -passwd "qwerty123" -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop >/dev/null 2>&1 &
nohup x11vnc -rfbauth /root/.vnc/passwd -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop >/dev/null 2>&1 &
/usr/share/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_SERVER_PORT} &

# service start nginx
/usr/sbin/nginx -g 'daemon off;'
