#!/bin/bash
set -e

service postgresql start

# Проверка, создана ли база
sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='mydb'" | grep -q 1 || sudo -u postgres psql -f /init_db.sql

cd /app


python3 manage.py migrate

echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'adminpass')" | python3 manage.py shell

python3 manage.py collectstatic --noinput

gunicorn myproject.wsgi:application --bind 0.0.0.0:8000 &

nginx -g "daemon off;"