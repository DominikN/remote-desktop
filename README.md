# remote-desktop

## Quick start

```
export VNC_PASSWORD="qwerty"
```

```
docker run \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
-p 8080:8080 \
-e DISPLAY \
-e VNC_PASSWORD \
--ipc="host" \
donowak/remote-desktop
```



