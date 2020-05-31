symfony:
	@echo "\033[92mBuilding and installing you application with Symfony 4.4\033[0m";
	symfony new web --full --version=4.4
	@echo "\042[92mSymfony 4.4 installed successfully ...\042[0m";
	$(MAKE) moveDocker
	$(MAKE) moveComposer
	$(MAKE) moveMakefile
	@echo "\032[92mPlease CD into the web folder and run : make start\032[0m";


start:
	@echo "\033[92mBuilding your docker containers\033[0m";
	docker-compose up --build -d
	@echo "\032[92mTo open the browser run : make openBrowser . This will open your application in http://localhost/\032[0m";


up:
	@echo "\033[92mBuilding your docker containers\033[0m";
	docker-compose up --build -d
	@echo "\032[92mTo open the browser run : make openBrowser . This will open your application in http://localhost/\033[0m";



stop:
	@echo "\033[92mShutting down you docker containers\033[0m";
	docker-compose down
	@echo "\032[92mShutting docker containers complete. To confirm run docker ps\032[0m";

down:
	@echo "\033[92mShutting down you docker containers\033[0m";
	docker-compose down
	@echo "\032[92mShutting docker containers complete. To confirm run docker ps\032[0m";

moveDocker:
	@echo "\033[92mCreating docker files\033[0m";
	mv  ./.docker ./web
	@echo "\032[92mDocker file Move completed ...\032[0m";

moveComposer:
	@echo "\033[92mCreating docker-compose files\033[0m";
	mv ./docker-compose.yml ./web
	@echo "\032[92mDocker-compose  file Move completed ...\032[0m";

moveMakefile:
	@echo "\033[92mCreating Makefile files\033[0m";
	cp ./Makefile ./web
	@echo "\032[92mMakefile copy completed ...\032[0m";
	rm ./Makefile
	@echo "\032[92mOld Makefile removal completed ...\032[0m";

openBrowser:
	@echo "\033[92mOpening your brower on http://localhost/\033[0m";
	open http://localhost/
	@echo "\032[92mPlease check your browser is now open and running a symfony landing page\032[0m";

reset:
	@echo "\033[92mResetting your application to factory settings\033[0m";
	$(MAKE) down
	mv ./.docker ../.docker
	mv ./docker-compose.yml ../docker-compose.yml
	cp ./Makefile ../Makefile
	rm -rf ../web





