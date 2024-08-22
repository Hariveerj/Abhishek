FROM node:14

WORKDIR /usr/app/src

COPY app/package*.json ./
RUN npm install

COPY app/ .

EXPOSE 3000

CMD ["npm", "start"]
