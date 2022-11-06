## Running novnc, vncserver and husarnet in separate containers

This folder is just for a reference to test the system divided into multiple docker containers.

### VPN

1. Create `.env` file and paste your Husarnet Join Code here (find it at https://app.husarnet.com)

```
JOINCODE=fc94:b01d:1803:8dd8:b293:5c7d:7639:932a/xxxxxxxxxxxxxxxxxxxxxx
```

2. Run in a terminal of the computer working in LAN:

```
xhost +
docker compose -f compose.vpn up
```

3. Open in a web browser:

```
http://my-desktop/vnc_auto.html
```

### LAN

1. Run in a terminal of the computer working in LAN:

```
xhost +
docker compose -f compose.vpn up
```

2. Open in a web browser:

```
http://IP_ADDR_OF_YOUR_DEVICE:8080/vnc_auto.html
```

## Random notes

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

### Troubleshooting

```
xwininfo -tree -root
```

### only SSH

If you want to start the remote desktop on remote host throgh SSH, remember abotu `-X` flag:

```bash
ssh husarion@10.5.10.32 -X
```