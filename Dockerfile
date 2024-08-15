# 1. 빌드 스테이지
FROM node:lts AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

# 2. 프로덕션 스테이지
FROM node:lts-alpine AS production

WORKDIR /app

COPY --from=builder /app/.output ./.output
COPY --from=builder /app/package.json ./
COPY --from=builder /app/package-lock.json ./

# 프로덕션 의존성만 설치
RUN npm ci --only=production

EXPOSE 3000

# 직접 Node.js로 서버 실행
CMD ["node", ".output/server/index.mjs"]