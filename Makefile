symfony:
	@echo "\033[92mINSTALL SYMFONY\033[0m";
	symfony new web --full --version=4.4
	@echo "\033[92mCreating docker files\033[0m";
	mv  ./.docker ./web
	@echo "\033[92mCreating docker-compose files\033[0m";
	mv ./docker-compose.yml ./web
	@echo "\033[92mCreating Makefile files\033[0m";
	mv ./Makefile ./web

start:
	docker-compose up  -d

stop:
	docker-compose down


