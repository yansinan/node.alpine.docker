#!/bin/bash
docker stop dora
docker rm dora
echo $HOME
docker run -it  \
# -p 80:8080 -p 443:8080 -p 8080:8080 -p 8900:8900 -p 8899:8899 -p 8888:8888 -p 9229:9229 -p 9999:9999 -p 5800:5800 -p 9230:9230 \
--name=dora --network=nginxNet \
-v /home/node/workspace/nodejsWebsite:/home/node -v /home/node/public/upload:/home/node/app/public/upload  --restart=always node:dora fish

# docker run -it --name=rubyeye --network=nginxNet -v /home/node/workspace/nodejsWebsite:/home/node -v /home/node/public/upload:/home/node/app/public/upload  --restart=always dora:rubyeye fish