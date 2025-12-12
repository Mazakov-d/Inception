FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php php-fpm php-mysql mariadb-client curl less unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp

COPY tools/ .

# RUN chmod +x script.sh

# ENTRYPOINT [ "script.sh" ]