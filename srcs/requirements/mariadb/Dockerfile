FROM debian:11-slim

RUN apt-get update && \
    apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY --chmod=755 tools/init_db.sh /usr/local/bin/init_db.sh

ENTRYPOINT [ "/usr/local/bin/init_db.sh" ]
