#!/bin/bash

export VNC_SERVER_PORT=5901
export NOVNC_PORT=8081

envsubst < /nginx.conf.template > /etc/nginx/conf.d/default.conf
# cat /etc/nginx/conf.d/default.conf

mkdir /root/.vnc
x11vnc -storepasswd ${PASSWORD} /root/.vnc/passwd

nohup x11vnc -rfbauth /root/.vnc/passwd -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop >/dev/null 2>&1 &
/usr/share/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_SERVER_PORT} &

# start nginx
/usr/sbin/nginx -g 'daemon off;'
