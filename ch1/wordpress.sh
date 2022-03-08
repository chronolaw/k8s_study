#!/bin/sh

# chrono @ 2022-04

# https://hub.docker.com/_/wordpress
#docker pull wordpress:5

# https://hub.docker.com/_/mariadb
#docker pull mariadb:10

# mysql has some problem with arm64
# docker pull mysql:8-oracle

# docker run -d --rm \
#     --net=host \
#     --env MARIADB_DATABASE=db \
#     --env MARIADB_USER=wp \
#     --env MARIADB_PASSWORD=123 \
#     --env MARIADB_ROOT_PASSWORD=123 \
#     mariadb:10

# docker run -d --rm \
#     -p 8080:80 \
#     --net=host \
#     --env WORDPRESS_DB_HOST=`hostname` \
#     --env WORDPRESS_DB_USER=wp \
#     --env WORDPRESS_DB_PASSWORD=123 \
#     --env WORDPRESS_DB_NAME=db \
#     wordpress:5

# docker exec -it a64 mysql -u wp -p
# show databases;
# use db;
# show tables;

# ip addr should be '172.17.0.2'
docker run -d --rm \
    --env MARIADB_DATABASE=db \
    --env MARIADB_USER=wp \
    --env MARIADB_PASSWORD=123 \
    --env MARIADB_ROOT_PASSWORD=123 \
    mariadb:10

# ip addr should be '172.17.0.3'
docker run -d --rm \
    --env WORDPRESS_DB_HOST=172.17.0.2 \
    --env WORDPRESS_DB_USER=wp \
    --env WORDPRESS_DB_PASSWORD=123 \
    --env WORDPRESS_DB_NAME=db \
    wordpress:5

docker run -d --rm \
    -p 80:80 \
    -v `pwd`/wp.conf:/etc/nginx/conf.d/default.conf \
    nginx:alpine

# in browser http://192.168.10.208
