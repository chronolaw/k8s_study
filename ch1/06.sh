#!/bin/sh

# chrono @ 2022-04

docker run -d --rm redis

echo 'aaa' > a.txt

# docker cp a.txt 062:/tmp
# docker exec 062 cat /tmp/a.txt
# docker exec -it 062 sh
# docker cp 062:/tmp/a.txt ./b.txt

docker run -d --rm -v /tmp:/tmp redis

docker pull python:alpine

# docker run -it --rm -v `pwd`:/tmp python:alpine sh
docker run --rm -v `pwd`:/tmp python:alpine python /tmp/hello.py

docker run -d --rm --net=host nginx:alpine
docker run -d --rm --net=host redis

curl 127.1

# sudo apt install net-tools
#netstat -ntlp
netstat -tlp

docker run -d --rm nginx:alpine
docker run -d --rm redis

#docker inspect 5a | grep IPAddress
#docker inspect ad | grep IPAddress

#ip addr |grep 172.17
#ping 127.17.0.3
#docker exec  5a ping 172.17.0.3

docker run -d -p 80:80 --rm nginx:alpine
docker run -d -p 8080:80 --rm nginx:alpine

curl 127.1:80   -I
curl 127.1:8080 -I

docker ps


