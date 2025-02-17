COMPOSE = srcs/docker-compose.yml
COMPOSE_CMD = docker compose -f $(COMPOSE)

BONUS_COMPOSE = bonus_srcs/docker-compose.yml
BONUS_COMPOSE_CMD = docker compose -f $(BONUS_COMPOSE)

all: build
	$(COMPOSE_CMD) up --detach --build

bonus: build
	$(BONUS_COMPOSE_CMD) up --detach --build

build:
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	sudo chmod -R 777 /home/${USER}/data/
	sudo chown -R ${USER} /home/${USER}/data/

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

mariadb:
	cd ./srcs
	docker exec -it mariadb bash

nginx:
	cd ./srcs
	docker exec -it nginx bash

wp:
	cd ./srcs
	docker exec -it wordpress bash

clean:
	sudo rm -rf /home/${USER}/data/mariadb
	sudo rm -rf /home/${USER}/data/wordpress
	cd srcs
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);

fclean: clean
	sudo docker system prune --volumes -a

re: clean all

.PHONY: all stop down ps fclean re mariadb nginx wp

