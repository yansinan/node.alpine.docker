#!/bin/bash
docker stop node
docker rm node
echo $HOME
docker run -it --name=node -p 8797:8797 -v $HOME/ownAlbum:/home/node --restart=always node fish
