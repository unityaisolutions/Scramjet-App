FROM node:18-alpine

ENV NODE_ENV=production
ARG NPM_BUILD="pnpm install --omit=dev"
EXPOSE 8080/tcp

LABEL maintainer="Mercury Workshop"
LABEL summary="Scramjet Demo Image"
LABEL description="Example application of Scramjet"

WORKDIR /app

COPY ["package.json", "pnpm-lock.json", "./"]
RUN apk add --upgrade --no-cache python3 make g++
RUN $PNPM_BUILD

COPY . .

ENTRYPOINT [ "node" ]
CMD ["src/index.js"]
