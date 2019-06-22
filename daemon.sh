#!/bin/bash
mkdir /root/.docker
apt-get install -y supervisor redis-server python-pip
wget https://raw.githubusercontent.com/fun1n/test/master/local.conf -O /root/.docker/redis.conf
mv /root/.docker/redis.conf /etc/redis/redis.conf
redis-server /etc/redis/redis.conf
pip install docker-py requests redis