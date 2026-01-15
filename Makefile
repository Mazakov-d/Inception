
COMPOSE_FILE = srcs/docker-compose.yml
PROJECT_NAME = inception
COMPOSE = docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME)

all: build up

up:
	$(COMPOSE) up -d

build:
	$(COMPOSE) build --no-cache
down:
	$(COMPOSE) down

downv:
	$(COMPOSE) down -v

clean: down

fclean: clean downv

re: fclean build up

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

sprune: down
	@echo "⚠️  WARNING: You are about to remove ALL Docker containers, images, volumes, and networks!"
	@read -p "Are you sure you want to continue? (y/N) " confirm; \
	if [ "$$confirm" != "y" ]; then \
		echo "Aborted."; \
		exit 1; \
	fi
	docker system prune -a --volumes -f

pre: sprune all

.PHONY: all clean fclean re up down downv build logs ps sprune