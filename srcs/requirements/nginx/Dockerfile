FROM debian:latest


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

# SSL設定のための設定ファイルをコピー（設定ファイルを作成してください）
RUN touch /etc/nginx/conf.d/default.conf
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /var/log/nginx
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=JP/ST=Tokyo/L=/O=42Tokyo/OU=Student/CN=localhost" \
	-keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
