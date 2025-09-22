
NAME = inception

all: up

up:
	docker-compose -p $(NAME) up -d --build

down:
	docker-compose -p $(NAME) down

re: down up

logs:
	docker-compose -p $(NAME) logs -f

ps:
	docker-compose -p $(NAME) ps

clean:
	docker-compose -p $(NAME) down -v --rmi all --remove-orphans
