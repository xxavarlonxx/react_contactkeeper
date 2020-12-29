FROM node:12-alpine as ui-build
WORKDIR /usr/src/app
COPY client/package*.json ./
RUN cd client && npm install
COPY . .
RUN cd client && npm run build

FROM node:12-alpine as server-build
WORKDIR /usr/src/app
COPY --from=ui-build /usr/src/app/build ./client/build
COPY package*.json .
RUN npm install
COPY . .