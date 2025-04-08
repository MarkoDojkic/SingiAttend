FROM alpine:edge

LABEL Maintainer="Marko Dojkic <marko.dojkic@gmail.com>"
LABEL Description="Docker container for running 'SingiAttend' Mongo Database on Alpine Linux"
RUN apk add -X https://nl.alpinelinux.org/alpine/edge/main -u alpine-keys --allow-untrusted
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
#Adding old alpine repositories for downloading mongodb
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories

#Install needed packages
RUN apk update && apk upgrade
RUN apk add bash supervisor mongodb mongodb-tools

VOLUME /data/db

RUN mkdir /var/mongodb_dumps/ && mkdir -p /etc/supervisor/conf.d/
COPY . /var/mongodb_dumps/
RUN rm /var/mongodb_dumps/Dockerfile
RUN mv /var/mongodb_dumps/supervisord.conf /etc/supervisor/conf.d/

#Expose MongoDB port
EXPOSE 27017

# Let supervisord start nginx & php-fpm & mongodb & mongoimport for database & java 
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]