# package UI app into nginx
#FROM node:13.10.1-slim as builder
FROM node:13.10.1-slim
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY quest/package.json /usr/src/app/package.json

#RUN npm install
COPY quest/. /usr/src/app
RUN npm install
EXPOSE 8080
CMD ["npm", "start"]

# production nginx environment
#FROM nginx:1.17.9-alpine
#COPY --from=builder /usr/src/app/build /usr/share/nginx/html
#
#RUN apk add --update openssl
#
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]