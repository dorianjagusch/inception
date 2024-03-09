FROM alpine:3.18

COPY ./conf/my.cnf /etc/my.cnf.d/my.cnf
COPY ./tools/script.sh /tmp/mariadb-setup.sh

RUN apk update && \
	apk add --no-cache \
	mariadb \
	mariadb-client && \
	chmod +x /tmp/mariadb-setup.sh

EXPOSE 3306

CMD ["sh",  "/tmp/mariadb-setup.sh"]

## docker build -t db-image .
## docker run  --name db-container -p 8080:3306 --rm db-image