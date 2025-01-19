FROM debian:11-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY --chmod=755 init_db.sh /usr/local/bin/init_db.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/init_db.sh" ]
