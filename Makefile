build:	create-dirs
	@docker-compose -f srcs/docker-compose.yml build

start:
	@docker-compose -f srcs/docker-compose.yml up

stop:
	@docker-compose -f srcs/docker-compose.yml down

clean:	remove-dirs
	@docker-compose -f srcs/docker-compose.yml down --volumes

create-dirs:
	@mkdir -p srcs/mariadb_data srcs/wordpress_data

remove-dirs:
	@rm -rf srcs/mariadb_data srcs/wordpress_data