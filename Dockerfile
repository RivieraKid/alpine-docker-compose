FROM alpine:latest

WORKDIR /

RUN apk add \
    gcc \
    libc-dev \
    libffi-dev \
    make \
    openssl-dev \
    py-pip \
    python2-dev && \
    rm -rf /var/cache

RUN pip install docker-compose

RUN mkdir /data && \
    mkdir -p /var/run

VOLUME ["/data"]

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]