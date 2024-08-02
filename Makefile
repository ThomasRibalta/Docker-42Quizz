
DOCKER_COMPOSE_FILE=docker-compose.yml

CONTAINERS=phpmyadmin frankenphp mysql

VOLUMES=docker-42quizz_mysql_data

IMAGES=docker-42quizz-php docker-42quizz-mysql phpmyadmin/phpmyadmin

.PHONY: all clean re

all:
	@echo "Cloning website..."
	git clone git@github.com:ThomasRibalta/Question-pour-un-piscineux-WEBSITE.git php/Question-pour-un-piscineux-WEBSITE
	@echo "Starting Docker Compose..."
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d
	@echo "Waiting for 5 seconds to ensure services are up..."
	sleep 10
	@echo "Running post-start commands..."
	docker exec -it php bash -c "cd commands && php fill.php"
	@echo "Remove site folder..."
	rm -rf php/Question-pour-un-piscineux-WEBSITE

clean:
	@echo "Stopping Docker Compose and cleaning up..."
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
	docker volume rm $(VOLUMES)
	docker rmi -f $(IMAGES)

re: clean all
