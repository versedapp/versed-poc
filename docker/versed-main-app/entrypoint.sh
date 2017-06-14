#!/bin/bash -l

set -e

if [ -z "$RAILS_ENV" ]; then
  RAILS_ENV=development
fi

if [ -z "$BRANCH" ]; then
  BRANCH=dev
fi

init_lock="/var/lock/container-init"

# Create lock file for init process
if [ ! -f $init_lock/initialize ]; then
    # Create a empty file when container initial setup
    init_lock=$init_lock /docker-scripts/setup_init_lock.sh

    # Setup rails app
    cd /opt/$APPLICATION/current
    git pull && git checkout $BRANCH
    bundle install
    #bundle exec rails db:setup
fi

if [ $# -eq 0 ]; then
  /bin/bash
else
  exec "$@"
fi
