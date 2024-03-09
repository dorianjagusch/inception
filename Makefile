# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: djagusch <djagusch@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/18 11:32:31 by djagusch          #+#    #+#              #
#    Updated: 2024/03/09 12:58:37 by djagusch         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME = /home/djagusch
DATA_LOCATIONS = $(HOME)/data/mariadb-data $(HOME)/data/wordpress-data
DOMAIN = djagusch.42.fr


all: setup up


setup:
	if ! grep -q "$(DOMAIN)" /etc/hosts; then \
		echo "127.0.0.1 $(DOMAIN)" | sudo tee -a /etc/hosts; \
	fi
	mkdir -p $(DATA_LOCATIONS)
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sudo sed -i '/djagusch\.42\.fr/d' /etc/hosts
	sudo rm -rf $(DATA_LOCATIONS)
	sudo docker system prune -f

re: fclean all

up:
	mkdir -p $(DATA_LOCATIONS)
	sudo docker compose -f srcs/docker-compose.yml up -d --build

down:
	sudo docker compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up down