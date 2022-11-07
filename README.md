# remote-desktop

NoVNC client + VNC server packed into a Docker image. Access your host's desktop over the network using a web browser.

## Quick start

1. make sure that `DISPLAY` environment variable is set:

    ```
    echo $DISPLAY
    ```

    > If the output is empty (eg. you are on remote SSH session), find all available displays:
    > 
    > ```
    > echo $(cd /tmp/.X11-unix && for x in X*; do echo ":${x#X}"; break; done)
    > :0
    > ```
    > 
    > From the output log above we have `:0` display available. Let's > save it in `~/.profile` file (to persist between boot)
    > 
    > ```
    > echo "DISPLAY=:0" >> ~/.profile
    > ```

2. setup a password for a VNC session 

    ```
    export PASSWORD="husarion"
    ```

3. adjust the permissions for the X server host

    ```
    xhost +local:docker
    ```

    > To persist the setting between boots, add the new line to `~/.profile` file
    > 
    > ```
    > echo "xhost +local:docker" >> ~/.profile
    > ```

4. run the container in a detached mode

    ```
    docker run -d \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -p 8080:8080 \
    -e DISPLAY \
    -e PASSWORD \
    --ipc=host \
    --restart=always \
    --name=remote-desktop \
    donowak/remote-desktop
    ```

5. Open the following URL in your web browser (of course replace `IP_ADDR` with you own IP/ Husarnet hostname):

    ```
    http://IP_ADDR:8080/vnc_auto.html
    ```

6. Stopping the remote desktop

    ```
    docker stop remote-desktop
    ```