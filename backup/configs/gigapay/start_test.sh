#!/bin/bash


# test="docker-compose -f ~/gigapay_dev/gigapay/local.yml run --rm django python manage.py test --noinput --parallel 8 --exclude-tag=integration --settings=config.settings.test"


if [ $# -eq 0 ]; then
  docker-compose -f ~/gigapay_dev/gigapay/local.yml run --rm django python manage.py test --noinput --parallel 8 --exclude-tag=integration --settings=config.settings.test
  # $test
else 
  docker-compose -f ~/gigapay_dev/gigapay/local.yml run --rm django python manage.py test --noinput --parallel 8 --exclude-tag=integration --settings=config.settings.test --keepdb "$1"
  # command="$test $1"
  # $command
fi
