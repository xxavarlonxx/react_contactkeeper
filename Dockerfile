FROM node:12-alpine as ui-build
WORKDIR /usr/src/app
COPY client/package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:12-alpine as server-build
WORKDIR /usr/src/app
COPY --from=ui-build /usr/src/app/build ./client/build
COPY package*.json .
RUN npm install
COPY . .