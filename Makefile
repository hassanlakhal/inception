all: up

up:
	@echo "build is starting ..."
	@cd src && docker-compose up --build > /dev/null

clean:
	@cd src && docker-compose down &&\
	 sudo rm -rf  /home/hlakhal-/data/*\
	 && sudo rm -rf /home/hlakhal-/databases/*\
	 && docker volume rm src_Mariadb src_WordPress > /dev/null

# CA:
# 	@sudo docker cp nginx:/etc/nginx/ssl/inception.crt \
# 	/usr/local/share/ca-certificates/
# 	@sudo update-ca-certificates

fclean:
	docker system prune -af