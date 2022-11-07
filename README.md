# remote-desktop

## Quick start

```
export PASSWORD="qwerty"
```

```
xhost +
```

```
docker run \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
-p 8080:8080 \
-e DISPLAY \
-e PASSWORD \
--ipc="host" \
donowak/remote-desktop
```


And enter your remote desktop under the following address:

```
http://IP_ADDR:8080/vnc_auto.html
```
