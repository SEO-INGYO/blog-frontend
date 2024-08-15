# 1. 빌드 스테이지
FROM node:lts AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

# 7. 프로덕션 스테이지
FROM node:lts-alpine AS production

WORKDIR /app

COPY --from=builder /app/.output ./.output
COPY --from=builder /app/package.json ./
COPY --from=builder /app/package-lock.json ./
RUN npm ci --omit=dev

EXPOSE 3000

CMD ["npm", "run", "start"]