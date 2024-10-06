FROM nginx:latest

COPY .environment/dev/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY . /application

WORKDIR /application
