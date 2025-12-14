#!/bin/bash
set -e

mysqld --user=mysql --datadir=/var/lib/mysql &

echo "Waiting MariaDb to be ready to set it."

until mariadb -e "SELECT 1;" >/dev/null 2>&1; do
    sleep 1
done

echo "MariaDb ready, setting user."

mariadb << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "Restarting MariaDb"

mysqladmin shutdown

exec mysqld --user=mysql --datadir=/var/lib/mysql
