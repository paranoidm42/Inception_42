DC := docker-compose -f ./srcs/docker-compose.yml

all:
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@$(DC) up -d --build

down:
	@$(DC) down	

up:
	@$(DC) up -d


re: clean all

clean:
	@$(DC) down -v --remove-orphans     
	@docker rmi -f $$(docker images -q) 

.PHONY: all down re clean