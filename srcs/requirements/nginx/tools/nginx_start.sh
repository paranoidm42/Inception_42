#!/bin/bash

SSL_CERT="/etc/ssl/certs/nginx.crt"
SSL_KEY="/etc/ssl/certs/nginx.key"

if [ ! -f "$SSL_CERT" ]; then
  echo "Setting up SSL for Nginx..."
  openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout "$SSL_KEY" -out "$SSL_CERT" -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=ccur.42.fr"
  echo "SSL setup completed."
fi

exec "$@"
