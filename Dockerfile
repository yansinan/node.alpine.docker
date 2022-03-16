#第一行必须指令基于的基础镜像
# for pi0 use this
#FROM arm32v6/node:current-alpine
# for x86 & x64
# FROM alpine:latest
FROM registry.cn-hangzhou.aliyuncs.com/aliyun-node/alinode:5.15.0-alpine
#维护者信息 dr
#镜像的操作指令
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && apk upgrade
# shell
RUN apk add --no-cache fish nano bash wget
# 修改时区
RUN apk add tzdata && \
    cp /usr/share//zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata



# 清理临时应用
RUN rm -rf /var/cache/apk/*


# #用户：
# ARG NAME_USER=dr
# # ENV NAME_USER dr
# RUN addgroup -S $NAME_USER && adduser -S $NAME_USER -G $NAME_USER
# USER $NAME_USER
# WORKDIR /home/$NAME_USER

# #添加bash_profile
# RUN echo "" > .bashrc 

# #下载alinode
# # 安装版本管理工具 tnvm，安装过程出错参考：https://github.com/aliyun-node/tnvm
# # 如果遇到网络问题，请切换为如下命令：
# # wget -O- https://code.aliyun.com/aliyun-node/tnvm/raw/master/install.sh | bash
# RUN wget -O- https://raw.githubusercontent.com/aliyun-node/tnvm/master/install.sh | bash \
#     && source ~/.bashrc

# #  查看需要的版本
# # 安装需要的版本
# # 安装 agenthub
# RUN tnvm ls-remote alinode \
#     && tnvm install alinode-v7.4.0 \ 
#     && tnvm use alinode-v7.4.0 \
#     && npm install @alicloud/agenthub -g  --registry=https://registry.npm.taobao.org
    
#nodeJS降级
RUN npm install n -g --registry=https://registry.npm.taobao.org \
    # && n 12.13.0 \    
    && npm install -g cnpm --registry=https://registry.npm.taobao.org 


# #eggjs初始化
# RUN npm init egg --type=simple \
#     && npm init egg --type=simple
# eggjs 脚本执行
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

# USER node
VOLUME ["/home/node"]
EXPOSE 7001
# WORKDIR /home/node

# COPY startapp.sh /startapp.sh
# RUN chmod +x /startapp.sh




#ENTRYPOINT ["/startapp.sh"]
#容器启动时执行指令
# CMD /bin/fish
