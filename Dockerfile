FROM alpine:edge

LABEL Maintainer="Marko Dojkic <marko.dojkic@gmail.com>"
LABEL Description="Docker container for running 'SingiAttend' BACK-END server (java spring-boot) and teacher FRONT-END web app written in PHP on Alpine Linux"
RUN apk add -X https://nl.alpinelinux.org/alpine/edge/main -u alpine-keys --allow-untrusted
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
#Old alpine repositories for downloading mongodb
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories

#Install needed packages
RUN apk update && apk upgrade
RUN apk add openrc supervisor
RUN apk add curl \
  nginx \
  php81 \
  php81-ctype \
  php81-curl \
  php81-dom \
  php81-fpm \
  php81-gd \
  php81-intl \
  php81-mbstring \
  php81-mysqli \
  php81-opcache \
  php81-openssl \
  php81-phar \
  php81-session \
  php81-simplexml \
  php81-xml \
  php81-xmlreader

RUN apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update coreutils && rm -rf /var/cache/apk/*   \ 
  && apk add --update openjdk11 tzdata curl unzip bash \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/*  

RUN apk add mongodb mongodb-tools
VOLUME /data/db

# Copy ngix and php81-fpm configurations
COPY FE/config/nginx.conf /etc/nginx/nginx.conf
COPY FE/config/conf.d /etc/nginx/conf.d/
COPY FE/config/fpm-pool.conf /etc/php81/php-fpm.d/www.conf 
COPY FE/config/php.ini /etc/php81/conf.d/custom.ini

# Configure nginx FE
RUN mkdir /var/www/html
COPY --chown=nginx FE/www /var/www/html/

#Configure and prepare BE
ADD SingiAttend-Server-2.4.6.jar app.jar

#Expose FE, MongoDB and BE ports
EXPOSE 8080 27017 62812

# Configure supervisord
COPY FE/config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# Let supervisord start nginx & php-fpm & mongodb & mongoimport for database & java 
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]