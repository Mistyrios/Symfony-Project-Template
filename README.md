# Symfony Template Project
This project is an alternative version of the work of [William Pinnaud](https://github.com/DocFX) on this project https://github.com/WebProjectsInitiatives/Symfony-Project-Template

This is a template project for Symfony. It can be used to start a new symfony project or it can be used with an existing project.

In this template you will have access to :
* Four containers : 
  - php-cli : for running symfony commands
  - php-fpm : for running symfony application
  - nginx : for serving symfony application
  - mysql : for database
* Several scripts allowing to :
  - Initialize the project
  - Create/Start different environments
  - Stop/Destroy different environments
* A Makefile to create custom commands for run scripts, enter in containers or various usages
* Symfony 6 with several bundles already installed like :
  - Doctrine
  - Maker Bundle
  - Twig
  - The requirements for CRUD Generator
  - Symfony Framework Bundle

## Requirements
* Docker : https://docs.docker.com/install/
* Composer : https://getcomposer.org/download/
* Make : 
  - For linux : Tap `sudo apt-get update & sudo apt-get install make` in the terminal.
  - MacOS : Tap `brew install make` in the terminal.
  - For windows : https://gnuwin32.sourceforge.net/packages/make.htm
* PHP 8.0.24 (Only For Linux And MacOS)
  - MacOS : Tap `brew install php@8.0 and brew link php@8.0 (If you have a other version of php installed)` in the terminal.
  - Linux : Tap `sudo apt-get update & sudo apt-get install php8.0` in the terminal.

## Installation
* Clone the project where you want to create your symfony project
* Do a `find & replace` of all `symfony-project-template` occurrences by your project name 
  - Tips: You can use ctrl+shift+R or cmd+shift+R in phpstorm
  - Tips: For rename the occurrences you should use a simple and short name. For Exemple you can just use four letter, Me for my symfony project `Wow Chronicles` I will use `woch`.
* Rename the `docker-sources/containers-config/nginx/dev-nginx/dev.symfony-project-template.local.conf` with the same name the occurrences of `symfony-project-template` in the previous step.
  - For Exemple with the `Wow Chronicle` project it should be done `docker-sources/containers-config/nginx/dev-nginx/dev.woch.local.conf`.
  - Do the same thing with the `docker-sources/containers-config/nginx/prod-nginx/prod.symfony-project-template.local.conf` file and `docker-sources/containers-config/nginx/qa-nginx/qa.symfony-project-template.local.conf`.
* Create `.env.dev.local`, `.env.staging.local`, `.env.prod.local` in the `docker-sources/environment-files` directory and copy the content of `docker-sources/environment-files/.env.[environment].local.dist` in it.
  - In the content of the file you should replace the `[environment]` occurrences by :
    - `prod` for the prod environment
    - `staging` for the staging environment
    - `dev` for the dev environment
  - In the content of the file you should replace the `[environment-port]` occurrences by :
      - `10301` for the prod environment
      - `10311` for the staging environment
      - `10321` for the dev environment
* Add the following line in your `/etc/hosts` file if your are on linux or macOS or in your `C:\Windows\System32\drivers\etc\hosts` file if you are on windows.
  - `127.0.0.1 dev.[project name].local`,`127.0.0.1 prod.[project name].local`,`127.0.0.1 staging.[project name].local`
  - Tips: For modify the hosts file you should be in administrator mode.
* Run the command :
  - `make init-project-win` for windows
  - `make init-project-lm` for linux & MacOS
* Run the command `make dev-env` to start the project in dev environment
  - Tips: You can find all the custom commands in the Makefiles directory.
* After you done the previous step you can access to your symfony project with the urls
  - `http://prod.[project name].local:10101`
  - `http://staging.[project name].local:10111`
  - `http://dev.[project name].local:10121`

## Update the template
For update the template you should do the following steps :
* For the composer and composer dependencies run the command `make update-composer`
* For update the php version use in the php-cli and php-fpm containers you should modify the docker files in `docker-sources/containers-config/php-cli/` and `docker-sources/containers-config/php-fpm/` for every environment.
* For update the nginx version use in the nginx container you should modify the docker files in `docker-sources/containers-config/nginx/` for every environment.
* For update the mysql version use in the mysql container you should modify the docker files in `docker-sources/containers-config/mysql/` for every environment.

## Help
* If you have any questions or if you want to contribute to this project you can create a new issue in this github repository.
