FROM node:20-slim as builder
WORKDIR /app
COPY package.json .
COPY package-lock.json* .
RUN npm ci

FROM node:20-slim
WORKDIR /app
COPY --from=builder /app/ /app/
COPY . .

EXPOSE 8080

CMD ["npx", "quartz", "build", "--serve"]
