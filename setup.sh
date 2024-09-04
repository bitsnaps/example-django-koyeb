#!/bin/bash

# Wait for PostgreSQL to start
# while ! nc -z db 5432; do
#   sleep 0.1
# done

# Apply database migrations
python manage.py makemigrations --noinput
python manage.py migrate --noinput

# Required environment variables:
if [[ $DEBUG ]]
then
    export DJANGO_SUPERUSER_PASSWORD="admin"
else
    export DJANGO_SUPERUSER_PASSWORD=$HOSTNAME
fi

echo "DJANGO_SUPERUSER_PASSWORD: $DJANGO_SUPERUSER_PASSWORD"

export DJANGO_SUPERUSER_USERNAME="admin"
export DJANGO_SUPERUSER_EMAIL="admin@example.com"
python manage.py createsuperuser --noinput

# Collect static files (THIS WILL BE DONE BY heroku)
python manage.py collectstatic --noinput