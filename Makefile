# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mdouglas <mdouglas@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/01 15:41:25 by mdouglas          #+#    #+#              #
#    Updated: 2024/05/01 15:46:44 by mdouglas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

GREEN	=	\033[0;32m
RED		=	\033[0;31m
RESET	=	\033[0m

COMPOSE=./srcs/docker-compose.yml

up:
	@mkdir -p data/wordpress data/mariadb
	@docker-compose -f $(COMPOSE) up -d --build
	@echo "$(GREEN)Wordpress is up and running on $(RESET)"

down:
	@sudo docker-compose -f $(COMPOSE) down -v
	@echo "$(RED)Wordpress is down$(RESET)"

stop:
	@sudo docker-compose -f $(COMPOSE) stop
	@echo "$(RED)Wordpress is stopped$(RESET)"

clean:
	@sudo rm -rf data/

re: down up

.PHONY: up down stop clean re