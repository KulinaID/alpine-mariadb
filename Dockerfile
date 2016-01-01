FROM alpine:3.2
MAINTAINER Didiet Noor <dnoor@kulina.id>
ENV TERM dumb
RUN apk -U upgrade && \
    apk --update add bash mariadb mariadb-client && \
    rm -fr /tmp/src && \
    rm -fr /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf

VOLUME /var/lib/mysql    

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]
