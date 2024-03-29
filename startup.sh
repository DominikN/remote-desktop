#!/bin/bash

export VNC_SERVER_PORT=5901
export NOVNC_PORT=8081

envsubst < /nginx.conf.template > /etc/nginx/conf.d/default.conf

if [[ -z "${DISPLAY}" ]]; then
    echo "ERROR | You need to run a display server first"
    exit 1
fi

if [[ -z "${PASSWORD}" ]]; then
    echo "no password set"
    nohup x11vnc -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop > /dev/null 2>&1 &
else
    mkdir /root/.vnc
    x11vnc -storepasswd ${PASSWORD} /root/.vnc/passwd
    nohup x11vnc -rfbauth /root/.vnc/passwd -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop > /dev/null 2>&1 &
fi

/usr/share/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_SERVER_PORT} > /dev/null 2>&1  &

echo ""
echo "visit http://IP_ADDR:8080/vnc_auto.html"

# start nginx
/usr/sbin/nginx -g 'daemon off;'
