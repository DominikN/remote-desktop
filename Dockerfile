FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
        net-tools \
        novnc  \
        x11vnc \
        nginx \
        iputils-ping \
        gettext-base && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY startup.sh /
COPY nginx.conf.template /

ENV PASSWORD=qwerty
ENV PORT=8080

EXPOSE ${PORT}

CMD [ "/startup.sh" ]
