#!/bin/bash
docker stop ncm.node
docker rm ncm.node
echo $HOME
docker run -d  \
--name=ncm.node --network=nginxNet \
--restart=always binaryify/netease_cloud_music_api

#-v $HOME/workspace/NetEaseCloudMusicApi:/home/node