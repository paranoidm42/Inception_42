FROM debian:buster

EXPOSE 443

RUN apt update && apt install -y nginx openssl

COPY ./tools/nginx_start.sh /home/
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

RUN chmod +x /home/nginx_start.sh

ENTRYPOINT [ "/home/nginx_start.sh" ]

CMD ["nginx", "-g", "daemon off;"]
