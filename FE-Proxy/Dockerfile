FROM alpine:edge

LABEL Maintainer="Marko Dojkic <marko.dojkic@gmail.com>"
LABEL Description="Docker container for running 'SingiAttend' BACK-END proxy server and teacher FRONT-END web app written in PHP on Alpine Linux"
RUN apk add -X https://nl.alpinelinux.org/alpine/edge/main -u alpine-keys --allow-untrusted
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
#Adding alpine repositories for php8.1
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.16/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.16/community' >> /etc/apk/repositories

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
  && apk add --update openjdk17 tzdata curl unzip bash \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/*  

# Copy ngix and php81-fpm configurations
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/conf.d /etc/nginx/conf.d/
COPY config/fpm-pool.conf /etc/php81/php-fpm.d/www.conf 
COPY config/php.ini /etc/php81/conf.d/custom.ini

# Configure nginx FE and Proxy
RUN mkdir /var/www/html
COPY --chown=nginx www /var/www/html/
ADD SingiAttend-Proxy-2.5.0.jar /var/www/SingiAttend-Proxy-2.5.0.jar

#Expose FE and Proxy ports
EXPOSE 8080 62810

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# Let supervisord start nginx & php-fpm & proxy app 
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]