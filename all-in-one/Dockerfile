FROM ubuntu:20.04
# FROM ubuntu/nginx:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
    x11vnc \
    net-tools \
    novnc \
    curl \
    iptables \
    procps \
    iproute2 \
    gnupg2 \
    nginx \
    xorg \
    iputils-ping && \
    curl https://install.husarnet.com/install.sh | bash && \
    apt-get remove -y \
    curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# RUN apt-get update -y && apt-get install -y \
#     libxext-dev

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

SHELL ["/bin/bash", "-c"]

COPY startup.sh /

# ENV QT_X11_NO_MITSHM=1 \
#     _X11_NO_MITSHM=1 \
#     _MITSHM=0

ENV JOINCODE remote-desktop
ENV HOSTNAME PLACE_YOU_OWN

CMD [ "/startup.sh" ]