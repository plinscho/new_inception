FROM debian:11-slim

RUN apt update && \
    apt install -y php7.4-fpm php7.4-mysqli curl mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
    
RUN mkdir -p /run/php && chmod 755 /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/wp_script.sh /usr/local/bin/wp_script.sh

RUN chmod +x /usr/local/bin/wp_script.sh

EXPOSE 9000

WORKDIR /var/www/html/

ENTRYPOINT [ "/usr/local/bin/wp_script.sh" ]
