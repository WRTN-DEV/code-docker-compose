all:
		@mkdir -p data/db
		@mkdir -p data/redis
		@docker compose -f ./docker-compose.yaml up --build -d

up:
		@docker compose -f ./docker-compose.yaml up -d

down:
		@docker compose -f ./docker-compose.yaml down

clean:
		@chmod 744 clean.sh
		@./clean.sh

ac:
		@make clean
		rm -rf ./data 2>/dev/null

re:
		@make clean
		@make 
info:
		@echo "=============================== IMAGES ==============================="
		@docker images
		@echo
		@echo "============================= CONTAINERS ============================="
		@docker ps -a
		@echo
		@echo "=============== NETWORKS ==============="
		@docker network ls
		@echo
		@echo "====== VOLUMES ======"
		@docker volume ls

.PHONY:	all up down clean info re ac
