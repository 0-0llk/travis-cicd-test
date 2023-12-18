FROM node:alpine as build
WORKDIR /svc/app/docker-react-app
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:latest as run
EXPOSE 80
COPY --from=build /svc/app/docker-react-app/build /usr/share/nginx/html