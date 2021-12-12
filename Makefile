# Собрать образы
docker-build:
	docker-compose build
# Собрать образы + проверить на наличие новых версии образов
docker-build-pull:
	docker-compose build --pull
	docker pull mysql:8.0
# Запуск контейнеров в фоновом режиме
docker-up:
	docker-compose up -d
# Перезапуск контейнеров
docker-restart:
	docker-compose restart
# Остановить контейнеры поднятые командой docker-compose up
docker-down:
	docker-compose down --remove-orphans
# Остановить контейнеры а также удалить тома
docker-down-clear:
	docker-compose down -v --remove-orphans
docker-outdated:
	docker-compose run --rm php-cli-debian composer outdated
docker-update:
	docker-compose run --rm php-cli-debian composer update
docker-version-soft:
	docker-compose run --rm nginx-debian sh -c "nginx -v"
	docker-compose run --rm mysql-debian sh -c "mysql -V"
	docker-compose run --rm php-fpm-debian sh -c "php-fpm -v"
	docker-compose run --rm php-cli-debian sh -c "composer -V"
ansible-version-soft:
	ansible all -m shell -a "php -v && nginx -v"  -i infrastructure/production/ansible/inventory/hosts.yml
# Пинг продакшенских серверов
ansible-ping:
	ansible all -m ping -i infrastructure/production/ansible/inventory/hosts.yml
# Информация о серверах
ansible-info:
	ansible slim -m setup -i infrastructure/production/ansible/inventory/hosts.yml
# Установка софта
ansible-install:
	ansible-playbook -i infrastructure/production/ansible/inventory/hosts.yml infrastructure/production/ansible/all.yml
# Выключить сервера
ansible-poweroff:
	ansible -m shell -a "init 0" all -i infrastructure/production/ansible/inventory/hosts.yml
# Деплой
ansible-deploy:
	ansible-playbook -i infrastructure/production/ansible/inventory/hosts.yml infrastructure/production/ansible/all.yml -t deploy
ansible-php:
	ansible-playbook -i infrastructure/production/ansible/inventory/hosts.yml infrastructure/production/ansible/all.yml -t php
ansible-php8.1:
	ansible-playbook -i infrastructure/production/ansible/inventory/hosts.yml infrastructure/production/ansible/all.yml -t php8.1
ansible-nginx:
	ansible-playbook -i infrastructure/production/ansible/inventory/hosts.yml infrastructure/production/ansible/all.yml -t nginx
# Настройка проекта
ansible-project:
	ansible-playbook -i infrastructure/production/ansible/inventory/hosts.yml infrastructure/production/ansible/all.yml -t project