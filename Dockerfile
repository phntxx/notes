FROM node:20-slim as builder
WORKDIR /app
COPY package.json .
COPY package-lock.json* .
RUN npm ci

FROM node:20-slim
WORKDIR /app
COPY --from=builder /app/ /app/
COPY . .

ENV REMOTE_HOST ""

EXPOSE 8080
EXPOSE 3001

CMD ["npx", "quartz", "build", "--remoteDevHost", "$REMOTE_HOST", "--serve"]
