FROM alpine:latest

RUN apk add \
    gcc \
    libc-dev \
    libffi-dev \
    make \
    openssl-dev \
    py-pip \
    python2-dev

RUN pip install docker-compose
