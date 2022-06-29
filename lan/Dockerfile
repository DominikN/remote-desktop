FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
        net-tools \
        novnc  \
        x11vnc && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY startup.sh /

ENV VNC_SERVER_PORT=5901
ENV NOVNC_PORT=8080

EXPOSE ${NOVNC_PORT}

CMD [ "/startup.sh" ]