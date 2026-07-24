FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# non-root user for security
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Copy app code
COPY app.py .

# Drop root privileges
USER appuser

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--threads", "4", "--access-logfile", "-", "app:app"]
