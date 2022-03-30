FROM ubuntu:20.04

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
    iputils-ping && \
    curl https://install.husarnet.com/install.sh | bash && \
    apt-get remove -y \
    curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

SHELL ["/bin/bash", "-c"]

COPY startup.sh /

ENV JOINCODE remote-desktop
ENV HOSTNAME PLACE_YOU_OWN
# ENV PASSWORD qwerty

EXPOSE 9090

CMD [ "/startup.sh" ]