
NAME = inception
COMPOSE = docker compose -f srcs/docker-compose.yml -p $(NAME)

all: up

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

reup: down up

logs:
	$(COMPOSE) logs nginx wordpress mariadb
