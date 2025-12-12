#!/bin/bash
set -e

cd /var/www/html

if ! wp core is-installed --allow-root; then
    echo "Installing WordPress..."

    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="db:3306" \
        --allow-root

    wp core install \
        --url="$SITE_URL" \
        --title="My Docker WP" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --role=author \
        --user_pass="$WP_USER_PASSWORD" \
        --allow-root
else
    echo "WordPress already installed. Skipping setup."
fi

exec "$@"