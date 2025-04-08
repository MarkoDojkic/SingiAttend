FROM alpine:edge

LABEL Maintainer="Marko Dojkic <marko.dojkic@gmail.com>"
LABEL Description="Docker container for running 'SingiAttend' BACK-END server on Alpine Linux"
RUN apk add -X https://nl.alpinelinux.org/alpine/edge/main -u alpine-keys --allow-untrusted
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

#Install needed packages
RUN apk update && apk upgrade && apk add openjdk17

RUN apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update coreutils && rm -rf /var/cache/apk/*   \ 
  && apk add --update openjdk17 tzdata unzip bash \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/* 

# Add BE
ADD SingiAttend-Server-2.5.0.jar /var/SingiAttend-Server-2.5.0.jar

# Start Server app
ENTRYPOINT ["java", "-jar", "/var/SingiAttend-Server-2.5.0.jar"]