FROM node:21.7.0-alpine3.19
WORKDIR /app
RUN apk update
COPY package*.json ./
RUN npm i
RUN npm run build
RUN npm cache clean --force
COPY . .
ENV PORT 3000
ENV TZ=America/Sao_Paulo
EXPOSE 3000
CMD ["npm", "start"]