#第一行必须指令基于的基础镜像
# for pi0 use this
#FROM arm32v6/node:current-alpine
# for x86 & x64
# FROM node:12.13-alpine
FROM node:lts-alpine
# FROM node:18.12.0-alpine3.16
#维护者信息 dr
#镜像的操作指令
# RUN apt-get update
# RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --no-cache fish nano bash
# 修改时区
RUN apk add tzdata && \
    cp /usr/share//zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata
#nodeJS降级
RUN npm install n -g --registry=https://registry.npm.taobao.org \
    # && n 12.13.0 \    
    && npm install -g cnpm --registry=https://registry.npm.taobao.org
#升级node 适配eggjs(node^16)
# RUN export N_NODE_MIRROR=https://npmmirror.com/mirrors/node && \
#     n lts_latest

# eggjs 脚本执行
# RUN npm i egg-init -g --registry=https://registry.npm.taobao.org
# RUN cnpm install apidoc -g  \
#     && cnpm install gulp -g  \
#     && cnpm install egg-scripts -g 

# 设置 inotifywait 或 inotifywatch 命令可以监视的文件数量
# RUN echo fs.inotify.max_user_watches=524288 >> /etc/sysctl.conf \ 
#     && sysctl -p

# sharp.npm安装
# RUN apk add python3 \
#     && npm config set sharp_binary_host "https://npm.taobao.org/mirrors/sharp" \
#     && npm config set sharp_libvips_binary_host "https://npm.taobao.org/mirrors/sharp-libvips" 
    # && npm install sharp

#下载
# RUN cd /home \
#     && git clone https://github.com/doramart/DoraCMS.git \
#     && ln -s /home/DoraCMS /home/node
#mongoDB
#RUN apt-get install -y mongodb \
#    && echo "\nmongoDB installed;" \
#    && ln -s /data /home/node/data \
#    && mongod -f /data/mongo.conf
#初始化
#RUN cd /home/node \
#    && npm install \
#    && npm run init

VOLUME ["/home/node"]
EXPOSE 8080 443
WORKDIR /home/node

# COPY startapp.sh /startapp.sh
# RUN chmod +x /startapp.sh
# eggjs初始化
# RUN cd ~ \
#    && npm init egg -r=https://registry.npm.taobao.org --type=simple

# COPY frpc /usr/sbin/frpc/frpc
# COPY frpc.ini /usr/sbin/frpc/frpc.ini
# RUN ln -s frpc /usr/sbin/frpc/frpc
# RUN ln -s frpc.ini /usr/sbin/frpc/frpc.ini
# 入口文件启动frpc
COPY entrypoint.sh /usr/sbin/frpc/entrypoint.sh
RUN chmod +x /usr/sbin/frpc/entrypoint.sh

ENTRYPOINT ["sh","/usr/sbin/frpc/entrypoint.sh"]
# ENTRYPOINT ["/usr/sbin/frpc/frpc","-c","/usr/sbin/frpc/frpc.ini","&"]
USER node
#容器启动时执行指令
# CMD /bin/fish
# build命令
# docker build -t node:eggjs .