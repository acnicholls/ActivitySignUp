# use NGINX as a reverse proxy
FROM nginx:latest

RUN apt update
RUN apt install -y inetutils-ping vim netstat-nat

# copy our configuration file
COPY ./nginx.prod.conf /etc/nginx/conf.d/default.conf

# copy our includes file
COPY ./includes.conf /etc/nginx/conf.d/proxy.conf

# run the post on 800 so docker can run multiple containers
EXPOSE 800