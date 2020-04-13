#!/bin/sh

cd /data
pwd
ls -al
mount
docker-compose $@
