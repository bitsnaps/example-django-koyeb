#!/bin/sh
set -e

# Start Gunicorn
exec gunicorn example_django.wsgi:application \
    --bind 0.0.0.0:${PORT} \
    --workers 2
