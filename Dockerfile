FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
# communication to developers, doesn't actually do anything, except on elastic bean stalk, cloud run etc
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

