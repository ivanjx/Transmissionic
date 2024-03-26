FROM node:lts-alpine as builder
WORKDIR /transmissionic
COPY * .
RUN npm install --loglevel verbose
RUN npm run build:webui

FROM nginx:alpine-slim
COPY --from=builder /transmissionic/dist /usr/share/nginx/html
COPY ./default.json /usr/share/nginx/html/
