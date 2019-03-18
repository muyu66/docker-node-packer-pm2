### 使用方法
http://pm2.keymetrics.io/docs/usage/docker-pm2-nodejs/

### 介绍
作为 docker-node-packer 的附属包

### Usage

FROM daocloud.io/chinxn/docker-node-packer:master as builder
LABEL zhouyu muyu.zhouyu@outlook.com
RUN git clone -b stable xxxxx server
WORKDIR /server
RUN npm install
RUN npm run build
RUN nodec --clean-tmpdir --tmpdir="/tmp" --make-args="-j4" -o /server.out ./build/src/main.js

FROM daocloud.io/chinxn/docker-node-packer-pm2:master
COPY --from=builder /server.out /
ENTRYPOINT pm2-runtime /server.out
