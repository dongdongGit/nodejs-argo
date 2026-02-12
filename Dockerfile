FROM node:alpine3.20

WORKDIR /tmp

# 1. 声明接收从 Actions 传过来的 5 个 ARG 参数
ARG UUID
ARG ARGO_DOMAIN
ARG ARGO_AUTH
ARG ARGO_PORT
ARG CFIP

# 2. 将这 5 个参数转化为容器运行时的环境变量，供 index.js 读取
ENV UUID=$UUID
ENV ARGO_DOMAIN=$ARGO_DOMAIN
ENV ARGO_AUTH=$ARGO_AUTH
ENV ARGO_PORT=$ARGO_PORT
ENV CFIP=$CFIP

COPY . .

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]
