# Build stage
FROM node:18 AS build-stage

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Production stage
FROM node:18 AS production-stage

WORKDIR /app

COPY --from=build-stage /app ./

# install only production dependencies
RUN npm ci --omit=dev

EXPOSE 3000

CMD ["npx", "nuxt", "start"]