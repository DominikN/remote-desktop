#!/bin/bash

export VNC_SERVER_PORT=5901
export NOVNC_PORT=8081

if [[ -z "${DISPLAY}" ]]; then
  export DISPLAY=$(cd /tmp/.X11-unix && for x in X*; do echo ":${x#X}"; break; done)
fi

if [[ -z "${DISPLAY}" ]]; then
  echo "You need to run a display server first"
  exit 1
elst
  echo "DISPLAY=${DISPLAY}"
fi

envsubst < /nginx.conf.template > /etc/nginx/conf.d/default.conf
# cat /etc/nginx/conf.d/default.conf

mkdir /root/.vnc
x11vnc -storepasswd ${PASSWORD} /root/.vnc/passwd > /dev/null 2>&1

nohup x11vnc -rfbauth /root/.vnc/passwd -rfbport ${VNC_SERVER_PORT} -display ${DISPLAY} -loop > /dev/null 2>&1 &
/usr/share/novnc/utils/launch.sh --listen ${NOVNC_PORT} --vnc localhost:${VNC_SERVER_PORT} > /dev/null 2>&1  &

echo "DISPLAY=${DISPLAY}"

# start nginx
/usr/sbin/nginx -g 'daemon off;'
