#!/usr/bin/env bash
docker rm $(docker ps -q -a) -f && docker rmi $(docker images -q) -f
docker network prune -f
docker volume prune -f

/home/deployer/bin/docker-compose -f docker-compose-staging.yml up --build -d
#/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm web rails db:drop
#/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm web rails db:create
#/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm web rails db:migrate
#/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm web rails g solidus:install
#/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm web rails db:seed
