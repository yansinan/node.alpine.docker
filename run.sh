#!/bin/sh
docker stop node
docker rm node
docker run -it --name=node -p 8797:8797 -v $HOME/ownAlbum:/hone/node --restart=always node fish
