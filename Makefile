build:
	@docker-compose -f srcs/docker-compose.yml build

start:
	@docker-compose -f srcs/docker-compose.yml up -d

stop:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker-compose -f srcs/docker-compose.yml down --volumes