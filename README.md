# remote-desktop
Trying to run VNC Server + NoVNC with a host OS

If you want to start the remote desktop on remote host throgh SSH, remember abotu `-X` flag:

```bash
ssh husarion@10.5.10.32 -X
```

## Quick start

```bash
xhost local:root

docker compose up
```

and open `http://localhost:8080/vnc_auto.html` in the web browser

or `http://my-desktop:9090/vnc_auto.html` if you want over the internet access (through Husarnet)

## All-in-one

### With Husarnet running inside the container

```bash
cd all-in-one

xhost local:root
docker compose up
```

And visit: `http://my-desktop:9090/vnc_auto.html`

### With Husarnet running on the host OS

```bash
cd all-in-one

xhost local:root
docker compose -f compose.net_host.yaml up
```

http://legion-y540:9090/vnc.html