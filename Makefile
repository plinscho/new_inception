COMPOSE = srcs/docker-compose.yml
COMPOSE_CMD = docker compose -f $(COMPOSE)

all:
	mkdir -p srcs/req/data/mariadb
	mkdir -p srcs/req/data/wp
	chmod -R 777 srcs/req/data/mariadb
	chmod -R 777 srcs/req/data/wp
	$(COMPOSE_CMD) up --detach --build

stop:
	@if [ ! -z "$$(docker ps -aq)" ]; then\
		$(COMPOSE_CMD) stop;\
	fi

down: stop
	$(COMPOSE_CMD) down

ps:
	@if [ ! -z "$$(docker ps -aq)" ]; then\
		docker ps;\
	fi

fclean: down
	rm -rf srcs/req/data
	@docker system prune -a

re: fclean all

.PHONY: all stop down ps fclean re

