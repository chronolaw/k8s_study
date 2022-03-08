# Dockerfile
# chrono @ 2022-03

# https://docs.docker.com/engine/reference/builder/

# docker build -t ngx-app .
# docker build -t ngx-app:1.0 .
# docker run -it ngx-app sh

ARG IMAGE_BASE="nginx"
ARG IMAGE_TAG="1.21-alpine"

FROM ${IMAGE_BASE}:${IMAGE_TAG}

ENV PATH=$PATH:/tmp
ENV DEBUG=OFF

COPY ./default.conf /etc/nginx/conf.d/

RUN cd /usr/share/nginx/html \
    && echo "hello nginx" > a.txt

EXPOSE 8081 8082 8083

WORKDIR /etc/nginx




