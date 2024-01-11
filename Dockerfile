FROM node:16 as build1
WORKDIR /react
COPY package*.json /react
RUN npm install
COPY . .
RUN npm run build

FROM ubuntu/apache2
WORKDIR /var/www/html
COPY --from=build1 /react/build/ /var/www/html
