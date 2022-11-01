#!/bin/bash
# build命令
# docker build -t node:cnpm .
name=eventsOfAmber

docker stop $name
docker rm $name
echo $HOME

docker run -it \
--name=$name \
-v $(pwd)/../../:/home/node \
-v $(pwd):/usr/sbin/frpc \
--network=nginxNet \
--restart=always \
--user=node \
node:eggjs
