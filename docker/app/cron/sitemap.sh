#!/bin/bash
cd /app && bundle exec rake sitemap:refresh &> /dev/null && echo "Refreshed sitemap"
