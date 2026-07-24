FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# non-root user for security
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Create /tmp with sticky bit so it's writable by appuser under a read-only root filesystem
RUN mkdir -p /tmp && chmod 1777 /tmp

# Copy app code
COPY app.py .

# Drop  root privileges
USER appuser

EXPOSE 5000

# Startup command using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--threads", "4", "--worker-tmp-dir", "/tmp", "--access-logfile", "-", "app:app"]
