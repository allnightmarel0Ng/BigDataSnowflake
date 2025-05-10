.PHONY: build run down migrate-up migrate-down

build:
	docker-compose build

run:
	docker-compose up -d 

down:
	docker-compose up down

migrate-up:
	migrate -path migrations/ -database postgres://admin:admin@localhost:5432/default?sslmode=disable up $(N)

migrate-down:
	migrate -path migrations/ -database postgres://admin:admin@localhost:5432/default?sslmode=disable down $(N)