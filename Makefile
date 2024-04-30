
# Build and run the container
up:
	docker compose up -d

# Stop and remove the container
down:
	docker compose down

run:
	docker exec -it corporate-cms sh