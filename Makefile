init:
	docker-compose up -d --build
	docker-compose exec dev bash -c 'yarn global add create-react-app && create-react-app $$PROJECT_NAME'
	cd app && git clone https://github.com/yuya-isaka/template-react-app.git
	docker-compose exec dev bash -c 'rm -rf $$PROJECT_NAME && mv template-react-app $$PROJECT_NAME && cd $$PROJECT_NAME && rm -rf .git'

up:
	docker-compose up -d
start:
	docker-compose exec dev bash -c 'cd $$PROJECT_NAME && yarn install && yarn start'
stop:
	docker-compose stop

ps:
	docker-compose ps
logs:
	docker-compose logs
in:
	docker-compose exec dev bash

down:
	docker-compose down
restart:
	@make down
	@make up

destroy:
	docker-compose down --rmi all --volumes
remake:
	@make destroy
	docker-compose build --no-cache --force-rm
	@make up

install:
	docker-compose exec -d dev bash -c 'cd $$PROJECT_NAME && yarn install'
run:
	docker-compose exec -d dev bash -c 'cd $$PROJECT_NAME && yarn start'