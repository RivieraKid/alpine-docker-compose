FROM alpine:latest

USER root

WORKDIR /

RUN apk add gcc \
    rm -rf /var/cache

RUN mkdir /data && \
    mkdir -p /var/run

VOLUME ["/data"]

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
