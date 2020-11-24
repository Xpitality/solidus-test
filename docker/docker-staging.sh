#!/usr/bin/env bash
/home/deployer/bin/docker-compose -f docker-compose-staging.yml build
/home/deployer/bin/docker-compose -f docker-compose-staging.yml up --build -d
/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm solidus_test rails db:drop
/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm solidus_test rails db:create
/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm solidus_test rails db:migrate
/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm solidus_test rails g solidus:install
/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm solidus_test rails db:seed

/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm solidus_test bundle exec rake assets:precompile

/home/deployer/bin/docker-compose -f docker-compose-staging.yml run --rm solidus_test rails spree_sample:load


#bin/rails railties:install:migrations
#bin/rails db:migrate
#bin/rails db:seed
#bin/rails spree_sample:load