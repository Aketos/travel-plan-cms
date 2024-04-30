FROM node:18-alpine3.17
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev coreutils
ARG NODE_ENV=development
ARG DATABASE_FILENAME=./tmp/data.db
ENV NODE_ENV=${NODE_ENV}
ENV DATABASE_FILENAME=${DATABASE_FILENAME}
WORKDIR /var
COPY package.json package-lock.json ./
RUN npm install -g node-gyp
RUN npm i -S sharp
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install
ENV PATH /var/node_modules/.bin:$PATH
WORKDIR /var/app
COPY . .
RUN ["npm", "run", "build"]
EXPOSE 1337
