FROM debian:11-slim

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl php7.4-fpm php7.4-mysqli mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php && \
    chmod 755 /run/php

COPY init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh

EXPOSE 9000

WORKDIR /var/www/html/

ENTRYPOINT [ "/usr/local/bin/init_wp.sh" ]
