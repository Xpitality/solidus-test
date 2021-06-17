#! /bin/bash
set -e

# Fix link-count, as cron is being a pain, and docker is making hardlink count >0 (very high)
touch /etc/crontab /etc/cron.*/*

# Setup a cron schedule
echo "5 * * * * /app/docker/app/cron/sitemap.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > /app/docker/app/crontab.txt

crontab /app/docker/app/crontab.txt
cron -f

# Remove a potentially pre-existing server.pid for Rails.
if [ -f "/app/tmp/pids/server.pid" ] ; then
    rm -f /app/tmp/pids/server.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
