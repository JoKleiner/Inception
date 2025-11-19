#!/bin/bash
set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /var/lib/mysql /run/mysqld || true
chmod 755 /run/mysqld || true

MYSQL_ROOT_PASSWORD="$(cat /run/secrets/db_root_password)"
MYSQL_PASSWORD="$(cat /run/secrets/db_password)"
MYSQL_USER="${MYSQL_USER:-wordpress}"
MYSQL_DATABASE="${MYSQL_DATABASE:-wordpress}"

#init DB
if [ -z "$(ls -A /var/lib/mysql 2>/dev/null)" ]; then
  if command -v mariadb-install-db >/dev/null 2>&1; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
  else
    mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
  fi

  mysqld --user=mysql --bootstrap <<-EOSQL
    SET @@SESSION.SQL_LOG_BIN=0;
    DELETE FROM mysql.user WHERE user='';
    CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL
fi

exec mysqld
