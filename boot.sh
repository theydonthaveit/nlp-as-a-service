#!/bin/sh
set -a

source venv/bin/activate
source .env
flask translate compile
exec gunicorn -b :5000 --access-logfile - --error-logfile - server:app
python model/load_nlp_models.py

set +a