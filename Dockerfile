FROM node:12-alpine as ui-build
WORKDIR /usr/src/app
COPY client ./client
RUN cd client && npm cache clear --force && npm install && npm run build

FROM node:12-alpine as server-build
WORKDIR /usr/src/app
COPY --from=ui-build /usr/src/app/client/build ./client/build
COPY package*.json .
RUN npm install
COPY . .