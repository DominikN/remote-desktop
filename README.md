# remote-desktop

## Quick start

1. make sure that `DISPLAY` environment variable is set:

```
echo $DISPLAY
:0
```

2. setup a password for a VNC session 

```
export PASSWORD="husarion"
```

3. adjust the permissions the X server host

```
xhost +local:docker
```

4. run the container in a detached mode

```
docker run -d \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
-p 8080:8080 \
-e DISPLAY \
-e PASSWORD \
--ipc="host" \
--restart=always \
donowak/remote-desktop
```

5. Open the following URL in your web browser (of course replace `IP_ADDR` with you own IP/ Husarnet hostname):

```
http://IP_ADDR:8080/vnc_auto.html
```
