#!/usr/bin/env bash
# exit on error
set -o errexit
set -o pipefail

echo "-----> Install dependencies"
python -m pip install --upgrade pip pipenv
pipenv install --system --deploy --ignore-pipfile

echo "-----> Running database migration"
python -m tabbycat.manage migrate --noinput

echo "-----> Running dynamic preferences checks"
python -m tabbycat.manage checkpreferences

echo "-----> Installing frontend dependencies"
npm install -g @vue/cli-service-global
npm ci --only=production

echo "-----> Building frontend assets"
npm run build

echo "-----> Collecting static files"
python -m tabbycat.manage collectstatic --noinput -v 0

echo "-----> Post-compile done"
