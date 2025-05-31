all: up

up:
	@echo "build is starting ..."
	@cd src && docker compose up --build -d 
	@echo "down !!"

down:
	@echo "down !!"
	@cd src && docker compose down

clean:
	@cd src && docker compose down && \
	sudo rm -rf $HOME/data/* && \
	sudo rm -rf $HOME/database/* && \
	docker volume rm src_Mariadb src_WordPress  /dev/null 2>&1 | \
	docker system prune -af

	
