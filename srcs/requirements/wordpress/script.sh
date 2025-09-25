#!/bin/bash
set -e

[ -f /run/secrets/wp_credentials ] && export $(grep -v '^#' /run/secrets/wp_credentials | xargs)
[ -f /run/secrets/db_password ] && export WORDPRESS_DB_PASSWORD="$(cat /run/secrets/db_password)"

: "${WORDPRESS_DB_NAME:=${MYSQL_DATABASE}}"
: "${WORDPRESS_DB_USER:=${MYSQL_USER}}"
: "${WORDPRESS_DB_HOST:=mariadb:3306}"

cd /var/www/html

chown -R www-data:www-data /var/www/html || true
chmod -R u+rw /var/www/html || true

if [ ! -f /usr/local/bin/wp ]; then
  curl -sSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
  chmod +x /usr/local/bin/wp
fi

if [ ! -f wp-config.php ]; then
  wp core download --allow-root
  wp config create \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST" \
    --allow-root

  wp core install \
    --url="$DOMAIN_NAME" \
    --title="Inception" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASS" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root

  if [ -n "$WP_EDITOR_USER" ] && [ -n "$WP_EDITOR_EMAIL" ]; then
    wp user create "$WP_EDITOR_USER" "$WP_EDITOR_EMAIL" --role=editor --user_pass="$WP_EDITOR_PASS" --allow-root || true
  fi
fi

exec php-fpm8.2 -F
