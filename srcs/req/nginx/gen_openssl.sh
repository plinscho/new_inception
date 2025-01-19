#!/bin/bash
#
# nginx configuration file
#
key_file='/etc/inception/certs/cert.pem'
cert_file='/etc/inception/certs/privkey.pem'
CERTS="/C=ES/ST=Barcelona/L=Barcelona/O=42/OU=Education/CN=plinscho"

if [ -r $key_file ]; then
	@echo "SSL file already exists."
else
	mkdir -p /etc/inception/certs/
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout $cert_file -out $key_file -subj $CERTS
fi

exec nginx -g "daemon off;"

