SRC_DIR				:= ./srcs

DOCKER_COMPOSE_FILE	:=$(SRC_DIR)/docker-compose.yml


RED		:= \033[1;31m
GREEN	:= \033[1;32m
YELLOW	:= \033[1;33m
DEFAULT	:= \033[0m

.PHONY: build up down re  rm rmi init

init:
	@echo "$(YELLOW) Init $(DEFAULT)"
	@echo "127.0.0.1 tasano"
# @docker compose -f $(DOCKER_COMPOSE_FILE) down
	@echo "$(GREEN) Init $(DEFAULT)"


build: 
	docker compose -f $(DOCKER_COMPOSE_FILE) build --no-cache

up:
	@docker compose -f $(DOCKER_COMPOSE_FILE) up -d
	@echo "$(GREEN) Docker Compose Up $(DEFAULT)"

down:
	@docker compose -f $(DOCKER_COMPOSE_FILE) down
	@echo "$(RED) Docker Compose Down $(DEFAULT)"

rmi:
	@docker compose -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes --remove-orphans
	@echo "$(RED) Remove all images $(DEFAULT)"


re: rmi build up
