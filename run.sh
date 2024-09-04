#!/bin/sh

DEBUG=False uvicorn backend_lms.asgi:application --host 0.0.0.0 --port 8000 --workers 2
