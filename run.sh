#! /bin/sh

docker run -it -d \
       --name deluge \
       -p 8112:8112 \
       -v /srv/deluge/torrents:/deluge/torrents \
       -v /srv/deluge/incomplete:/deluge/incomplete \
       -v /srv/deluge/complete:/deluge/complete \
       -v /srv/deluge/config:/deluge/config \
       -e PUID=1001 \
       -e PGID=1001 \
       gaigepr/deluge-docker
