FROM debian:stretch-slim
MAINTAINER Gaige Pierce-Raison <gaigepr@gmail.com>

ARG PUID=1001
ARG PGID=1001

WORKDIR /deluge

RUN apt-get update \
    && apt-get install -y deluged deluge-web
    
RUN mkdir config torrents incomplete complete \
    && groupadd -g ${PGID} deluge \
    && useradd -u ${PUID} -g deluge deluge \
    && chown ${PUID}:${PGID} /deluge \
    && chown ${PUID}:${PGID} /deluge/* 

USER deluge
COPY entrypoint.sh /deluge/entrypoint.sh
EXPOSE 8112
EXPOSE 53160
EXPOSE 53160/udp
VOLUME ["/deluge/torrents", "/deluge/incomplete", "/deluge/complete", "/deluge/config"]

CMD ["sh", "entrypoint.sh"]
