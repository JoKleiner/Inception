#!/bin/bash
set -e

cd /var/www/html

chown -R www-data:www-data /var/www/html || true
chmod -R u+rw /var/www/html || true

sleep 2

if [ ! -f /usr/local/bin/wp ]; then 
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar            
    mv wp-cli.phar /usr/local/bin/wp
fi                                  

if [ ! -f wp-config.php ]; then
  if [ ! -f index.php ]; then
    wp core download --allow-root                   
  fi

  wp config create \                               
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root

  wp core install \                                
    --url=$DOMAIN_NAME \
    --title="Inception" \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS \
    --admin_email=$WP_ADMIN_EMAIL \
    --allow-root

  wp user create $WP_EDITOR_USER $WP_EDITOR_EMAIL \
    --role=editor \
    --user_pass=$WP_EDITOR_PASS \
    --allow-root
fi

php-fpm8.2 -F
