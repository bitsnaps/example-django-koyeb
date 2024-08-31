FROM python:3-alpine AS builder

WORKDIR /app

RUN python3 -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

# Stage 2
FROM python:3-alpine AS runner

ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV PORT=8000
ENV DEBUG=True

WORKDIR /app

COPY --from=builder /app/venv venv
COPY backend_lms backend_lms
COPY api api
COPY static static
COPY templates templates
COPY entrypoint.sh /entrypoint.sh
COPY manage.py /manage.py
COPY staticfiles /app/staticfiles

EXPOSE ${PORT}

# Moved to: entrypoint.sh
# CMD gunicorn --bind :${PORT} --workers 2 backend_lms.wsgi

ENTRYPOINT ["/entrypoint.sh"]

