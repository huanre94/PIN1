FROM node:11.1.0-alpine

WORKDIR /app

ADD package.json package-lock.json /app/
RUN npm install
RUN chmod +x /app/node_modules/.bin/mocha

EXPOSE 3000

ADD . /app

CMD ["node", "index"]
