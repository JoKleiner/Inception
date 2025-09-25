
FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh && mkdir -p /run/mysqld

CMD ["/usr/local/bin/script.sh"]
