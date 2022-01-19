FROM python:3.9-slim as production


ENV PYTHONUNBUFFERED=1
WORKDIR /app/

# Run *system* dependencies needed to connect to postgres
RUN apt-get update && \
    apt-get install -y \
    bash \
    build-essential \
    gcc \
    libffi-dev \
    musl-dev \
    openssl \
    postgresql \
    libpq-dev



# Copy files docker image
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
COPY manage.py ./manage.py
COPY tracker ./tracker
COPY usecase ./usecase
COPY users ./users

# Expose port that the Application runs on.
EXPOSE 8000

FROM production as devel

COPY . .