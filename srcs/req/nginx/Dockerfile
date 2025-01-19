FROM debian:11-slim

RUN apt-get update && apt-get upgrade -y && apt install -y nginx openssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY gen_openssl.sh /usr/local/bin/gen_openssl.sh

RUN mkdir -p /etc/inception/certs/ && \
	chown -R 999:999 /usr/share/nginx/ && \
	chmod +x /usr/local/bin/gen_openssl.sh

ENTRYPOINT ["/usr/local/bin/gen_openssl.sh"]

