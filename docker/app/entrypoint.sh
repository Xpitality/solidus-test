#! /bin/sh
set -e

if [ $RAILS_ENV = "dev" ] ; then
	echo "Running dev migrations"
	RAILS_ENV=$RAILS_ENV bundle exec rake db:migrate
fi

RAILS_ENV=$RAILS_ENV bundle exec rake db:migrate

# Remove a potentially pre-existing server.pid for Rails.
if [ -f "/app/tmp/pids/server.pid" ] ; then
    	rm -f /app/tmp/pids/server.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
