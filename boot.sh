#!/bin/sh
set -a

source venv/bin/activate
source .env
flask translate compile
exec gunicorn -b :5000 --access-logfile - --error-logfile - server:app

set +a