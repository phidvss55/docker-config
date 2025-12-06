DOCKER := /Applications/Docker.app/Contents/Resources/bin/docker
# DOCKER := /usr/local/bin/docker

run: up

up:
	$(DOCKER) compose -f docker-compose.yml up -d

up-db:
	$(DOCKER) compose -f docker-compose.db.yml up -d

up-redis:
	$(DOCKER) compose -f docker-compose.redis.yml up -d

up-kafka:
	$(DOCKER) compose -f docker-compose.kafka.yml up -d

ssh-mysql:
	$(DOCKER) exec -it c-mysql bash

ssh-redis:
	$(DOCKER) exec -it c-redis redis-cli

down: docker-compose.yml
	$(DOCKER) compose down --remove-orphans

print-path:
	@echo $$PATH
