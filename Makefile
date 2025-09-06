.PHONY: help dev build test clean seed

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

dev: ## Start development environment
	docker-compose up -d postgres redis mqtt
	@echo "Waiting for services to be ready..."
	@sleep 10
	npm run dev

build: ## Build all services
	docker-compose build

up: ## Start all services
	docker-compose up -d

down: ## Stop all services
	docker-compose down

seed: ## Seed database with demo data
	docker-compose exec api python scripts/seed_data.py

logs: ## Show logs from all services
	docker-compose logs -f

test: ## Run all tests
	npm run test

test-e2e: ## Run end-to-end tests
	npm run test:e2e

test-load: ## Run load tests
	npm run test:load

clean: ## Clean up containers and volumes
	docker-compose down -v
	docker system prune -f

reset: clean build up seed ## Reset entire environment

install: ## Install dependencies
	npm install

format: ## Format code
	npm run format

lint: ## Lint code
	npm run lint

docs: ## Generate API documentation
	docker-compose exec api python scripts/generate_docs.py

backup: ## Backup database
	docker-compose exec postgres pg_dump -U postgres smart_campus > backup_$(shell date +%Y%m%d_%H%M%S).sql

restore: ## Restore database (usage: make restore FILE=backup.sql)
	docker-compose exec -T postgres psql -U postgres smart_campus < $(FILE)
