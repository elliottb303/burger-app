FROM node:10
WORKDIR /usr/src/app
ARG SECRET_WORD
ENV SECRET_WORD=$SECRET_WORD

COPY quest/package*.json ./
RUN npm install

# Bundle app source
COPY quest/. .

EXPOSE 3000
CMD ["npm", "start"]
