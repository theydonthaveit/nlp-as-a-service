#!/bin/bash
set -e

source venv/bin/activate
source .env
python scripts/load_nlp_models.py
# flask translate compile
exec gunicorn -b :5000 --access-logfile - --error-logfile - server:app