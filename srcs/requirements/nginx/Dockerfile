FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl gettext-base && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
RUN mkdir -p /var/log/nginx
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=JP/ST=Tokyo/L=/O=42Tokyo/OU=Student/CN=localhost" \
	-keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
