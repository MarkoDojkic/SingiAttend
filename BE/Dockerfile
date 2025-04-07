FROM alpine:edge

LABEL Maintainer="Marko Dojkic <marko.dojkic@gmail.com>"
LABEL Description="Docker container for running 'SingiAttend' BACK-END server on Alpine Linux"
RUN apk add -X https://nl.alpinelinux.org/alpine/edge/main -u alpine-keys --allow-untrusted
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

#Install needed packages
RUN apk update && apk upgrade && apk add openjdk17

# Add BE
ADD SingiAttend-Server-2.5.0.jar /var/SingiAttend-Server-2.5.0.jar

# Start Server app
ENTRYPOINT ["java", "-jar", "/var/SingiAttend-Server-2.5.0.jar"]