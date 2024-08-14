# 1단계: 빌드 스테이지
FROM node:18 as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# 2단계: 프로덕션 스테이지
FROM node:18 as production-stage

ENV NODE_ENV=production

WORKDIR /app

COPY --from=build-stage /app ./

RUN npm install --production

EXPOSE 3000

CMD ["npx", "nuxt", "start"]