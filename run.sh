#!/bin/bash
nameContainer="node"
docker stop $nameContainer
docker rm $nameContainer
echo $(pwd)
docker run -it  \
--name=$nameContainer \
--network=nginxNet \
--rm \
-v $(pwd)/../..:/home/node \
node:base fish

# --rm \
#--restart=always \
# -p 8084:8080 -p 8900:8900 -p 8899:8899 -p 8888:8888 -p 9229:9229 -p 9999:9999 -p 5800:5800 -p 9230:9230 \
