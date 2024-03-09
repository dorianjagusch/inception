FROM alpine:3.18

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

RUN apk update && \
	apk add --no-cache \
    nginx \
    openssl && \
    mkdir -p /run/nginx /etc/nginx/ssl && \
    openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/certificate.crt \
    -keyout /etc/nginx/ssl/certificate.key \
    -subj "/C=FI/ST=Helsinki/L=Helsinki/O=Hive/OU=djagusch/CN=djagusch.42.fr" && \
    addgroup -S www && \
	adduser -S -H -g "" www -G www && \
    sed -i 's/user nginx/user www www/' /etc/nginx/nginx.conf && \
	sed -i 's/ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;/ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

