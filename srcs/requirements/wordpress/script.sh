#!/bin/bash
set -e              #stops if something went wrong for debugging

export WORDPRESS_DB_PASSWORD="$(cat /run/secrets/db_password)"
export $(grep -v '^#' /run/secrets/credentials | xargs)

mkdir -p /var/www/html
cd /var/www/html
chown -R www-data:www-data /var/www/html || true

#install WP shell extension WP-CLI
if [ ! -f /usr/local/bin/wp ]; then                     
  curl -sSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
  chmod +x /usr/local/bin/wp
fi

if [ ! -f wp-config.php ]; then
  if [ ! -f index.php ]; then
    wp core download --allow-root
  fi

  DB_HOST=$(echo "${WORDPRESS_DB_HOST:-mariadb}" | cut -d: -f1)
  for i in $(seq 30); do
    mysqladmin ping -h"$DB_HOST" >/dev/null 2>&1 && break
    sleep 1
  done

  #create wp-config.php and set NAME, ...
  wp --path=/var/www/html config create \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbhost="$WORDPRESS_DB_HOST" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --allow-root

  #install WP with conditions
  wp --path=/var/www/html core install \
    --url="https://$DOMAIN_NAME" \
    --title="Inception" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASS" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root
fi

if ! wp user get "$WP_EDITOR_USER" --allow-root >/dev/null 2>&1; then
  wp user create "$WP_EDITOR_USER" "$WP_EDITOR_EMAIL" --user_pass="$WP_EDITOR_PASS" --role=editor --allow-root
fi

exec php-fpm8.2 -F
