# remote-desktop

Trying to run VNC Server + NoVNC with a host OS

If you want to start the remote desktop on remote host throgh SSH, remember abotu `-X` flag:

```bash
ssh husarion@10.5.10.32 -X
```

## Quick start

### Check available displays

```bash
husarion@rosbot2r:~$  ls -la /tmp/.X11-unix
total 8
drwxrwxrwt  2 root root 4096 Jan 10  2022 .
drwxrwxrwt 16 root root 4096 Aug  9 12:45 ..
srwxrwxrwx  1 root root    0 Jan 10  2022 X0
```

and check `DISPLAY` env:

```bash
husarion@rosbot2r:~/remote-desktop$ echo $DISPLAY
```

if empty, set it to the one of available displays:

```bash
export DISPLAY=:0
```

### Start containers

```bash
xhost local:root

docker compose up
```

and open `http://localhost:8080/vnc_auto.html` in the web browser

or `http://my-desktop:9090/vnc_auto.html` if you want over the internet access (through Husarnet)

### Troubleshooting

```
xwininfo -tree -root
```

## All-in-one

### With Husarnet running inside the container

```bash
cd lan

xhost local:root
docker compose up
```

And visit: `http://my-desktop:9090/vnc_auto.html`

### With Husarnet running on the host OS

```bash
cd vpn

xhost local:root
docker compose -f compose.net_host.yaml up
```

http://legion-y540:9090/vnc.html