FROM debian:11-slim

RUN apt-get update && \
	apt install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

COPY tools/gen_openssl.sh /usr/local/bin/gen_openssl.sh

RUN chmod +x /usr/local/bin/gen_openssl.sh

ENTRYPOINT ["/usr/local/bin/gen_openssl.sh"]
