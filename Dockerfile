FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
        net-tools \
        novnc  \
        x11vnc \
        nginx \
        iputils-ping && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY startup.sh /
COPY nginx.conf /etc/nginx/conf.d/default.conf

ENV VNC_SERVER_PORT=5901
ENV NOVNC_PORT=8081
ENV VNC_PASSWORD=qwerty

EXPOSE ${NOVNC_PORT}

CMD [ "/startup.sh" ]
