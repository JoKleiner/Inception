
FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y \
    php8.2-fpm php8.2-cli php8.2-mysql curl unzip mariadb-client

#Version php8.2 runs perfect for bookworm

COPY www.conf /etc/php/8.2/fpm/pool.d/.
COPY script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]
