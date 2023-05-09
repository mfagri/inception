build:	create-dirs
	@docker-compose -f srcs/docker-compose.yml build

start:
	@docker-compose -f srcs/docker-compose.yml up

stop:
	@docker-compose -f srcs/docker-compose.yml down

clean:	remove-dirs
	@docker-compose -f srcs/docker-compose.yml down --volumes

create-dirs:
	@mkdir -p ${HOME}/data/database ${HOME}/data/files 

remove-dirs:
	@sudo rm -rf ${HOME}/data/database ${HOME}/data/files 