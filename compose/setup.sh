#!/bin/bash
#
# https://docs.docker.com/compose/install/compose-plugin/#installing-compose-on-linux-systems

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins

# intel x86_64
#curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 \
#     -o $DOCKER_CONFIG/cli-plugins/docker-compose

# apple m1
curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-aarch64 \
     -o $DOCKER_CONFIG/cli-plugins/docker-compose

chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# test docker compose
docker compose version
