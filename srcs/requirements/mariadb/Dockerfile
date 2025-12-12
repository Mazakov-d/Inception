FROM debian:bullseye

RUN apt-get update -y\
    && apt-get install -y\
    mariadb-server

RUN mkdir -p /run/mysql/

RUN chown mysql:mysql /run/mysql/
