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
http://my-desktop:8080/vnc_auto.html
```
