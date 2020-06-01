# Docker PHP Symfony starter kit with phpMyAdmin

## Introduction

### This repository contains a docker environment which will enable you to run PHP Symfony as well as a PHPMyAdmin MySql database. You can set up your application and docker containers by running the commands in the Makefile.


```
######## process #########

git clone https://github.com/jwill9999/docker-php-mysql.git

cd into folder

make symfony
```

### This will load :

> A Symfony 4.4 application


> It will set up you files to run docker and apache as well as your database.

### To build your containers and environment

```
make up

or

make start
```

### This will do all the work for you and will build all the containers that you will need including a php environemnt, MySql database, and phpMyAdmin.

To Open the browser

```
make openBrowser
```

### To stop the containers

```
make stop

or

make down
```

## CAUTION

### You can reset you whole environemnt to factory settings by running

```
make reset
```

### This will delete the whole application !


