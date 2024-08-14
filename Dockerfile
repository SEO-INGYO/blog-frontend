# 1. 빌드 스테이지
FROM node:lts AS builder

# 2. 작업 디렉터리 설정
WORKDIR /app

# 3. package.json과 lock 파일 복사
COPY package*.json ./

# 4. 종속성 설치
RUN npm install

# 5. 애플리케이션 소스 복사
COPY . .

# 6. Nuxt 애플리케이션을 프로덕션 빌드
RUN npm run build

# 7. 프로덕션 스테이지
FROM node:lts-alpine AS production

# 8. 작업 디렉터리 설정
WORKDIR /app

# 9. 빌드된 파일 복사
COPY --from=builder /app/.output ./.output

# 10. 필요한 종속성만 설치
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

# 11. 포트 설정 (기본값은 3000)
EXPOSE 3000

# 12. 애플리케이션 시작
CMD ["node", ".output/server/index.mjs"]