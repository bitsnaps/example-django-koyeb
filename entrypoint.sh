#!/bin/sh
set -e

# Wait for PostgreSQL to start
# while ! nc -z db 5432; do
#   sleep 0.1
# done

# Apply database migrations
cd /app
python manage.py makemigrations --noinput
python manage.py migrate --noinput

# Required environment variables:
export DJANGO_SUPERUSER_PASSWORD=$USER
export DJANGO_SUPERUSER_USERNAME="admin"
export DJANGO_SUPERUSER_EMAIL="admin@example.com"
python manage.py createsuperuser --noinput

# Collect static files
# python manage.py collectstatic --noinput

# Start Gunicorn
exec gunicorn example_django.wsgi:application \
    --bind 0.0.0.0:${PORT} \
    --workers 2
