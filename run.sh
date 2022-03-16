#!/bin/bash
nameContainer="alinode"
docker stop $nameContainer
docker rm $nameContainer
echo $(pwd)
docker run -it  \
--name=$nameContainer --network=nginxNet \
-v $(pwd)/../..:/home/node \
--restart=always \
alinode:base fish
# --user=node \
# -p 8084:8080 -p 8900:8900 -p 8899:8899 -p 8888:8888 -p 9229:9229 -p 9999:9999 -p 5800:5800 -p 9230:9230 \
