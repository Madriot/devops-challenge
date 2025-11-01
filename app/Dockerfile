FROM node:22-alpine as builder

WORKDIR /app

RUN corepack enable

COPY package.json yarn.lock .yarnrc.yml /app
COPY src /app/src

RUN yarn workspaces focus --production

FROM node:22-alpine

WORKDIR /app

RUN addgroup -S app && adduser -S app -G app
RUN rm /bin/sh

USER app

COPY --from=builder /app /app

ENTRYPOINT ["node", "src/main.mjs"]