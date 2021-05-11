FROM node:lts-alpine

ARG PROXY
ARG NO_PROXY
ARG NPM_REGISTRY
ENV NO_PROXY $NO_PROXY
ENV HTTP_PROXY $PROXY
ENV HTTPS_PROXY $PROXY

RUN apk add --update --no-cache g++ gcc libgcc libstdc++ linux-headers make python

RUN npm config set @ecom:registry $NPM_REGISTRY/npm-all/

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build:docker

EXPOSE 8080

CMD [ "npm", "run", "start"]