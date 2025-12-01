FROM node:25-alpine3.21 AS base

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install ci --omit=dev
COPY . .
RUN npm run build
EXPOSE 3000
ENV HOSTNAME="0.0.0.0"
CMD npm run dev