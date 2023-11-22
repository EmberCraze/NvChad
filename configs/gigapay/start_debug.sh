#!/bin/bash

docker compose -f ~/gigapay_dev/gigapay/local.yml -f ~/gigapay_dev/gigapay/.nvim/override_debug.yml up --exit-code-from django --abort-on-container-exit django
