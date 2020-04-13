FROM alpine:latest

RUN apk add \
    gcc \
    libffi-dev \
    py-pip \
    python2-dev

RUN pip install docker-compsoe
