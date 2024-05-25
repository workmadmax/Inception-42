up :
	mkdir -p ${PWD}/data/db-data
	mkdir -p ${PWD}/data/wp-data
	@ echo "127.0.0.1 mdouglas.42.fr" >> /etc/hosts
	docker-compose -f ./srcs/docker-compose.yml up --d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down --v
	docker system prune -af
	sudo rm -rf ${PWD}/data
	
re: clean
	docker system prune -af
	$(MAKE) -s up

.PHONY: up down clean re