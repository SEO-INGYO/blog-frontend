# 1단계: 빌드 스테이지
FROM node:18 as build-stage

# 작업 디렉토리 설정
WORKDIR /app

# package.json과 package-lock.json 복사
COPY package*.json ./

# npm install로 패키지 설치
RUN npm install

# 애플리케이션 코드 복사
COPY . .

# Nuxt 애플리케이션 빌드
RUN npm run build

# 2단계: 프로덕션 스테이지
FROM node:18 as production-stage

# 환경 변수를 설정
ENV NODE_ENV=production

# 작업 디렉토리 설정
WORKDIR /app

# 빌드된 애플리케이션 복사
COPY --from=build-stage /app ./

# npm prune로 개발 의존성 제거
RUN npm prune --production

# Nuxt 애플리케이션 시작
CMD ["npm", "run", "start"]