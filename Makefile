NAME = inception42

all: start

start:
	@mkdir -p $(PWD)/data/mariadb
	@mkdir -p $(PWD)/data/wordpress
	@echo "127.0.0.1 mdouglas.42.org.br" >> /etc/hosts
	@docker-compose -f srcs/docker-compose.yml up --build

stop:
	@docker-compose -f srcs/docker-compose.yml down -v

clean: stop
	@rm -rf "./data/mariadb"
	@rm -rf "./data/wordpress"
	@docker system prune -f
	@docker image prune -af
	@docker volume rm srcs_wordpress srcs_mariadb
	@rm -rf $(PWD)/logs/*

.PHONY: start stop clean
