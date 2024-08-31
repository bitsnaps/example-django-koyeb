#!/bin/sh
set -e

# Start Gunicorn
exec gunicorn backend_lms.wsgi:application \
    --bind 0.0.0.0:${PORT} \
    --workers 2
