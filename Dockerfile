FROM alpine:3.2
MAINTAINER Didiet Noor <dnoor@kulina.id>
ENV TERM dumb


# Patch APK Mirror to YKode
RUN echo "https://alpine.ykode.com/alpine/v3.2/main" > /etc/apk/repositories

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
