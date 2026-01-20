FROM debian:12.12

RUN apt-get update && apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /usr/bin/

RUN chmod +x /usr/bin/script.sh

EXPOSE 3306

ENTRYPOINT ["script.sh"]


