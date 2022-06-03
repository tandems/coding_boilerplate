RUN := run --rm
DOCKER_COMPOSE_RUN := docker-compose $(RUN)

init:
	@make build
	@make npm_install

build:
	docker-compose build

rebuild:
	docker-compose build --force-rm --no-cache

up:
	docker-compose up

upd:
	docker-compose up -d

down:
	docker-compose down

attach:
	docker attach (docker-compose ps -q app)

npm_install:
	${DOCKER_COMPOSE_RUN} node npm install

lint:
	${DOCKER_COMPOSE_RUN} node npm run lint

format:
	${DOCKER_COMPOSE_RUN} node npm run format

app_build:
	${DOCKER_COMPOSE_RUN} node npm run build

down.all:
	if [ -n "`docker ps -q`" ]; then docker kill `docker ps -q`; fi
		docker container prune -f
