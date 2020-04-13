FROM alpine:latest

RUN apk \
    gcc \
    libffi-dev \
    py-pip \
    python2-dev

RUN pip install docker-compsoe
