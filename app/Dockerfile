FROM node:22-alpine as builder

WORKDIR /app

RUN corepack enable

COPY package.json yarn.lock .yarnrc.yml /app
COPY src /app/src

RUN yarn install

FROM node:22-alpine

WORKDIR /app

RUN rm /bin/sh

COPY --from=builder /app /app

ENTRYPOINT ["node", "src/main.mjs"]