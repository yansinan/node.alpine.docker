#!/bin/bash
# build命令
# docker build -t node:cnpm .
name=eggWebSocket

docker stop $name
docker rm $name
echo $HOME

docker run -it \
--name=$name \
-v $(pwd)/../:/home/node \
--network=nginxNet \
-p 4000:4000 \
--restart=always \
--user=node \
node:eggjs fish
