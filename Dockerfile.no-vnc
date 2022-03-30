FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
    net-tools \
    novnc

# CMD /usr/share/novnc/utils/launch.sh --listen 8080 --vnc vnc-server:5900