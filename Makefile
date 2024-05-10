all:
	cd src && docker-compose up --build

clean:
	cd src && docker-compose down && sudo rm -rf  /home/hlakhal-/data/*
