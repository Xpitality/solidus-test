#! /bin/sh
set -e

echo "environment and master key:"
echo $RAILS_ENV
echo $RAILS_MASTER_KEY

echo "MIGRATIONS START"
RAILS_ENV=$RAILS_ENV bundle exec rake db:migrate
echo "MIGRATIONS END"

if [[ $? != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo
  RAILS_ENV=$RAILS_ENV bundle exec rake db:create
  RAILS_ENV=$RAILS_ENV bundle exec rake db:migrate
  RAILS_ENV=$RAILS_ENV bundle exec rake db:seed
fi

#echo "SEEDING START"
#RAILS_ENV=$RAILS_ENV bundle exec rake db:seed
#echo "SEEDING END"

# Remove a potentially pre-existing server.pid for Rails.
if [ -f "/app/tmp/pids/server.pid" ] ; then
    rm -f /app/tmp/pids/server.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
