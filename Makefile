
NAME = inception
COMPOSE = docker-compose -f srcs/docker-compose.yml -p $(NAME)

all: up

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

reup: down up

start:
	$(COMPOSE) start

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

clean:
	$(COMPOSE) down -v --rmi all --remove-orphans
