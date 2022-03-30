FROM node:14
WORKDIR /src
COPY package.json .
RUN npm install
COPY . .
CMD npm start

FROM node:14
WORKDIR /src
COPY package.json .
RUN npm install
COPY . .
CMD npm run startAuthServer 