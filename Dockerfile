FROM node:alpine3.20

WORKDIR /tmp

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
