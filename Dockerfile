FROM node:21-alpine AS build
WORKDIR /my-app
COPY package.json ./
RUN npm install

COPY . .
RUN npm run build

FROM node:21-alpine
COPY --from=build /my-app /my-trade
WORKDIR /my-trade
EXPOSE 3000
CMD ["npm","run","start"]
