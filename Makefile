symfony:
	@echo "\033[94mBuilding and installing you application with Symfony 4.4\033[0m";
	symfony new web --full --version=4.4
	@echo "\033[32mSymfony 4.4 installed successfully ...\033[0m";
	$(MAKE) moveDocker
	$(MAKE) moveComposer
	$(MAKE) moveMakefile
	@echo "\033[32mPlease CD into the web folder and run : make start\033[0m";


start:
	@echo "\033[94mBuilding your docker containers\033[0m";
	docker-compose up --build -d
	@echo "\033[32mTo open the browser run : make openBrowser . This will open your application in http://localhost/\033[0m";


up:
	@echo "\033[94mBuilding your docker containers\033[0m";
	docker-compose up --build -d
	@echo "\033[32mTo open the browser run : make openBrowser . This will open your application in http://localhost/\033[0m";



stop:
	@echo "\033[94mShutting down you docker containers\033[0m";
	docker-compose down
	@echo "\033[32mShutting docker containers complete. To confirm run docker ps\033[0m";

down:
	@echo "\033[94mShutting down you docker containers\033[0m";
	docker-compose down
	@echo "\033[32mShutting docker containers complete. To confirm run docker ps\033[0m";

moveDocker:
	@echo "\033[94mCreating docker files\033[0m";
	mv  ./.docker ./web
	@echo "\033[32mDocker file Move completed ...\033[0m";

moveComposer:
	@echo "\033[94mCreating docker-compose files\033[0m";
	mv ./docker-compose.yml ./web
	@echo "\033[32mDocker-compose  file Move completed ...\033[0m";

moveMakefile:
	@echo "\033[94mCreating Makefile files\033[0m";
	cp ./Makefile ./web
	@echo "\033[34mMakefile copy completed ...\033[0m";
	rm ./Makefile
	@echo "\033[32mOld Makefile removal completed ...\033[0m";

openBrowser:
	@echo "\033[94mOpening your brower on http://localhost/\033[0m";
	open http://localhost/
	@echo "\033[32mPlease check your browser is now open and running a symfony landing page\033[0m";

reset:
	@echo "\033[94mResetting your application to factory settings\033[0m";
	$(MAKE) down
	mv ./.docker ../.docker
	mv ./docker-compose.yml ../docker-compose.yml
	cp ./Makefile ../Makefile
	rm -rf ../web




