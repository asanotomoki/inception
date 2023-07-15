SRC_DIR				:= ./srcs
REQUIREMENTS_DIR	:= $(SRC_DIR)/requirements

DOCKER_COMPOSE_FILE	:=$(SRC_DIR)/docker-compose.yaml

NGINX_DIR			:= $(REQUIREMENTS_DIR)/nginx
NGINX_FILE			:= $(NGINX_DIR)/Dockerfile

WORDPRESS_DIR		:= $(REQUIREMENTS_DIR)/wordpress
WORDPRESS_FILE		:= $(WORDPRESS_DIR)/Dockerfile

MARIADB_DIR			:= $(REQUIREMENTS_DIR)/mariadb
MARIADB_FILE		:= $(MARIADB_DIR)/Dockerfile


RED		:= \033[1;31m
GREEN	:= \033[1;32m
YELLOW	:= \033[1;33m
DEFAULT	:= \033[0m

.PHONY: build-nginx

build-nginx: 
	@echo "$(GREEN) Build Nginx $(DEFAULT)"
	@docker build $(NGINX_DIR)

build-wordpress:
	@echo "$(GREEN) Build Wordpress $(DEFAULT)"
	@docker build $(WORDPRESS_DIR)

build-mariadb:
	@echo "$(GREEN) Build Mariadb $(DEFAULT)"
	@docker build $(MARIADB_DIR)

build-all: 
	make build-nginx
	make build-wordpress 
	make build-mariadb

up:
	@echo "$(GREEN) Docker Compose Up $(DEFAULT)"
	@docker compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	@echo "$(RED) Docker Compose Down $(DEFAULT)"
	@docker compose -f $(DOCKER_COMPOSE_FILE) down

re: down up
