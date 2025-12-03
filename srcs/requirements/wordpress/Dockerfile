FROM debian:bullseye

RUN apt update -y && \
    apt install php-fpm php-cli curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar