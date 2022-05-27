#Đóng gói NodeJS App để thực hiện các request thông qua API
FROM node:14
WORKDIR /src
COPY package.json .
RUN npm install
COPY . .
CMD npm start
