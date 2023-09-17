FROM node:16.20.0-alpine3.18 AS build

WORKDIR /app/

RUN npm install -g @angular/cli@^13.3.11

COPY package*.json ./.

RUN npm install

EXPOSE 4200

CMD ["ng", "serve", "--", "--host", "0.0.0.0"]
