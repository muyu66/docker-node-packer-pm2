FROM daocloud.io/library/node:8.1-alpine
LABEL maintainer="Zhouyu <muyu.zhouyu@outlook.com>"
RUN npm install pm2 -g
EXPOSE 80 443 43554