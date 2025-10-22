FROM node:22-alpine

WORKDIR /app

COPY package.json /app
COPY yarn.lock /app
COPY src /app/src
COPY .yarnrc.yml /app

RUN corepack enable
RUN yarn install

CMD ["node", "src/main.mjs"]