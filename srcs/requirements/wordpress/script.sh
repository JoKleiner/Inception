#!/bin/bash

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

./wp-cli.phar core install \
  --url=localhost \
  --title=inception \
  --admin_user=superuser \
  --admin_password=klo \
  --admin_email=joklein@student.42heilbronn.de \
  --allow-root

./wp-cli.phar user create editor editor@example.com --role=editor --user_pass=editorpass --allow-root

php-fpm8.2 -F
