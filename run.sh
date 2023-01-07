#!/bin/bash

HTTP_PORT=23400
HTTPS_PORT=24000

if [ ! -d data ]; then
    echo "Directory data not found, creating it for you"
    mkdir -p data
fi
if [ ! -d music ]; then
    echo "Directory music not found, creating it for you"
    mkdir -p music;
fi
if [ ! -d playlist ]; then
    echo "Directory playlist not found, creating it for you"
    mkdir -p playlist;
fi
if [ ! -d podcast ]; then
    echo "Directory podcast not found, creating it for you"
    mkdir -p poscast;
fi

echo "Starting Docker on ports $HTTP_PORT:$HTTPS_PORT"

docker run -d \
    --name=airsonic-advanced \
    -e TZ=Europe/Rome \
    -v data:/airsonic/data \
    -v music:/airsonic/music \
    -v playlists:/airsonic/playlists \
    -v podcasts:/airsonic/podcasts \
    -p $HTTP_PORT:$HTTPS_PORT \
    -e JAVA_OPTS="" \
    --restart unless-stopped \
    airsonic/airsonic
sleep 5
docker logs airsonic-advanced
fi
