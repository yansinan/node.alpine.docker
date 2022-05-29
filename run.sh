#!/bin/bash
# build命令
# docker build -t node:cnpm .
name=bilibiliForAmber

docker stop $name
docker rm $name
echo $HOME

docker run -it \
--name=$name \
-v $(pwd)/../../:/home/node \
--network=nginxNet \
--restart=always \
--user=node \
node:eggjs
