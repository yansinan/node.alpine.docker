#!/bin/sh
docker stop node
docker rm node
docker run -it --name=node -p 8797:8797 -v $HOME/node:/home/node --restart=always node fish
