FROM python:3.9-slim

# where the code lives

ENV PYTHONUNBUFFERED=1

RUN mkdir /config

# Copy local files to docker image working directory /app/
ADD /config/requirements.txt /config/

# Installs dependencies
# PSYCOPG2 dependencies https://www.psycopg.org/docs/install.html#build-prerequisites
RUN pip install --upgrade pip && \
    apt-get update &&\
    # a C Compliler 'gcc' is even required for psycopg2
    apt-get install gcc -y && \ 
    apt-get install python3.9-dev -y &&\
    apt-get install libpq-dev -y &&\
    pip install psycopg2-binary && \
    pip install postgres && \
    pip install -r /config/requirements.txt

# create a source directory for your Django Project
RUN mkdir /src
WORKDIR /src

CMD python manage.py collectstatic --no-input;python manage.py makemigrations;python manage.py migrate;gunicorn usecase.wsgi -b 0.0.0.0:8000


# Copies Django project files so it can run inside docker container.
# Alternatively, you may use 'COPY . .' to grab all files form the active Dir but this is nt desired in a Prod environment so that it can be kept lean. 
#
# COPY manage.py src/manage.py
# COPY tracker src/tracker
# COPY usecase src/usecase
# COPY users src/users

# Data dump json was necessary to pre-populate the PostgreSQL DB with values.
#
# COPY datadump.json config/datadump.json

# Expose port that the Application runs on.
#
# EXPOSE 8000


