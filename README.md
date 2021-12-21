Slim prototype - для создания проектов на базе Slim Framework 4

Версии ПО на сервере:

- php 8.0.14 (20.12.2021) - [https://github.com/php/php-src/tags](https://github.com/php/php-src/tags)
- php 8.1.1 (20.12.2021) - Обновлено на сервере, сейчас две версии 8.0 и 8.1
- composer 2.1.14 (30.11.2021) - [https://github.com/composer/composer/tags](https://github.com/composer/composer/tags)
- nginx 1.21.4 (02.11.2021) - [https://github.com/nginx/nginx/tags](https://github.com/nginx/nginx/tags)
- mysql 8.0.27 (06.10.2021) - [https://github.com/mysql/mysql-server/tags](https://github.com/mysql/mysql-server/tags)

Локально : docker
- docker 20.10.12 (13.12.2021) - [https://github.com/docker/cli/tags](https://github.com/docker/cli/tags)
- docker-compose 1.29.2 (10.05.2021) [https://github.com/docker/compose/tags](https://github.com/docker/compose/tags) 
- docker-compose 2.2.2 (03.12.2021) [Установка](https://docs.docker.com/compose/cli-command/#install-on-linux) (`docker compose up -d` - запуск контейнеров)
- `make docker-up` - запуск контейнеров


Локально : ansible
- ansible 2.11.7 (06.12.2021) - [https://github.com/ansible/ansible/tags](https://github.com/ansible/ansible/tags)
- `make ansible-install` - установка софта и разворачивание проекта на проде выполнение всех тасков, но лучше делать это указывая роль которую нужно выполнить
- `make ansible-deploy` - только деплой приложения