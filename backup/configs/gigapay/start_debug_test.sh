#!/bin/bash

if [ $# -eq 0 ]; then
  docker-compose -f ~/gigapay_dev/gigapay/local.yml -f ~/gigapay_dev/gigapay/.nvim/override_debug.yml run --no-deps --rm django python manage.py test --noinput --parallel 8 --exclude-tag=integration --settings=config.settings.test
else 
  docker-compose -f ~/gigapay_dev/gigapay/local.yml -f ~/gigapay_dev/gigapay/.nvim/override_debug.yml run --no-deps --rm django python manage.py test --noinput --parallel 8 --exclude-tag=integration --settings=config.settings.test --keepdb "$1"
fi
