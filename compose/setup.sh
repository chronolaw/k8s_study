#!/bin/bash
#
# https://docs.docker.com/compose/install/compose-plugin/#installing-compose-on-linux-systems

# intel x86_64
#sudo curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 \
#          -o /usr/local/bin/docker-compose

# apple m1
sudo curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-aarch64 \
          -o /usr/local/bin/docker-compose

#chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# test docker compose
docker-compose version
