# Собрать образы
docker-build:
	docker-compose build
# Собрать образы + проверить на наличие новых версии образов
docker-build-pull:
	docker-compose build --pull
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