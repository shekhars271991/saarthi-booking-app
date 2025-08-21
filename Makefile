.PHONY: help install dev build clean docker-up docker-down docker-build

# Default target
help:
	@echo "Saarthi Monorepo - Available Commands:"
	@echo ""
	@echo "Development:"
	@echo "  make install    - Install all dependencies"
	@echo "  make dev        - Start both backend and frontend in development mode"
	@echo "  make dev:backend - Start only backend in development mode"
	@echo "  make dev:frontend - Start only frontend in development mode"
	@echo ""
	@echo "Building:"
	@echo "  make build      - Build both projects"
	@echo "  make build:backend - Build only backend"
	@echo "  make build:frontend - Build only frontend"
	@echo ""
	@echo "Docker:"
	@echo "  make docker-up  - Start all services with Docker Compose"
	@echo "  make docker-down - Stop all Docker services"
	@echo "  make docker-build - Build Docker images"
	@echo ""
	@echo "Maintenance:"
	@echo "  make clean      - Clean all node_modules and build artifacts"
	@echo "  make logs       - Show logs from all services"

# Install dependencies
install:
	@echo "Installing root dependencies..."
	npm install
	@echo "Installing backend dependencies..."
	cd saarthi-backend && npm install
	@echo "Installing frontend dependencies..."
	cd saarthi-webapp && npm install
	@echo "All dependencies installed!"

# Development
dev:
	@echo "Starting both services in development mode..."
	npm run dev

dev:backend:
	@echo "Starting backend in development mode..."
	cd saarthi-backend && npm run dev

dev:frontend:
	@echo "Starting frontend in development mode..."
	cd saarthi-webapp && npm run dev

# Building
build:
	@echo "Building both projects..."
	npm run build

build:backend:
	@echo "Building backend..."
	cd saarthi-backend && npm run build

build:frontend:
	@echo "Building frontend..."
	cd saarthi-webapp && npm run build

# Docker commands
docker-up:
	@echo "Starting all services with Docker Compose..."
	docker-compose up -d

docker-down:
	@echo "Stopping all Docker services..."
	docker-compose down

docker-build:
	@echo "Building Docker images..."
	docker-compose build

# Maintenance
clean:
	@echo "Cleaning all projects..."
	npm run clean

logs:
	@echo "Showing logs from all services..."
	docker-compose logs -f
