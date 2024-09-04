#!/bin/bash
set -e

# Start Gunicorn
# exec gunicorn backend_lms.wsgi:application \
#     --bind 0.0.0.0:${PORT} \
#     --workers 2

# Start uvicorn
exeec uvicorn backend_lms.asgi:application \
    --host 0.0.0.0 \
    --port ${PORT} \
    --workers 2