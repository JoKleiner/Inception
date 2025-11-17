#!/bin/bash

#stops if something went wrong, debugging
set -e                 

#start MariaDB in background
mysqld_safe &          

# Wait server is ready
until mysqladmin ping --silent; do
  sleep 1
done

#read secrets
MYSQL_PASSWORD=$(cat /run/secrets/db_password)
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
MYSQL_USER=${MYSQL_USER:-wordpress}
MYSQL_DATABASE=${MYSQL_DATABASE:-wordpress}

#create database
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
  CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
  CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
  GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
  FLUSH PRIVILEGES;
EOSQL

#shutdown temporary server
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown    

#start mariaDB normally
exec mysqld   
