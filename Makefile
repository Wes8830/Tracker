# Aliases for common commands with arguments that make them dynamic

# Builds the docker container called tracker-website.
build:
	docker build --force-rm $(options) -t tracker-website:latest .

build-prod:
	$(MAKE) build options="--target production"

compose-start:
	docker-compose up --remove-orphans $(options)

compose-stop:
	docker-compose stop --remove-orphans $(options)

# docker-compose down on the other hand will remove the container which may not be desired.

compose-manage-py:
	docker-compose run --rm $(options) web python manage.py $(cmd)

# lists active containers. running 'docker ps -a' instead will show all containers inactive/active.
list-containers:
	docker ps

remove-container:
	docker rm $(container_id)

# Get Datadump from postgres
dump-data:
	docker exec -u postgres tracker_postgres_1 pg_dump > $(name)
