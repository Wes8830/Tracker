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



# Copy local files to docker image working directory /app/
COPY requirements.txt ./requirements.txt
# Installs dependencies
RUN pip install -r requirements.txt
# Copies Django project files so it can run inside docker container.
# Alternatively, you may use 'COPY . .' to grab all files form the active Dir but this is nt desired in a Prod environment so that it can be kept lean. 
COPY manage.py ./manage.py
COPY tracker ./tracker
COPY usecase ./usecase
COPY users ./users
# Data dump json was necessary to pre-populate the PostgreSQL DB with values.
COPY datadump.json ./datadump.json

# Expose port that the Application runs on.
EXPOSE 8000

FROM production as devel

COPY . .


