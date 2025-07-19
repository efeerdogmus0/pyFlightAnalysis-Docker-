# Docker image and container naming
IMAGE_NAME = pyflightanalysis
CONTAINER_NAME = pyflightanalysis-app

# Default target will be 'help'
.DEFAULT_GOAL := help

.PHONY: help build run stop clean

help:
	@echo "Available commands:"
	@echo "  make build          - Build the Docker image"
	@echo "  make run            - Run the application in a Docker container"
	@echo "  make stop           - Stop the running container"
	@echo "  make clean          - Remove Docker image and containers"

build:
	@echo "Building Docker image..."
	@docker build -t $(IMAGE_NAME) .

run:
	@echo "Starting application..."
	-docker stop $(CONTAINER_NAME) > /dev/null 2>&1 || true
	-docker rm $(CONTAINER_NAME) > /dev/null 2>&1 || true
	docker run -it --rm \
		--name $(CONTAINER_NAME) \
		-e DISPLAY=:0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
		-v $(HOME)/.Xauthority:/root/.Xauthority:ro \
		-e XAUTHORITY=/root/.Xauthority \
		--net=host \
		-v $(shell pwd):/app \
		-v $(HOME):$(HOME) \
		-w $(HOME) \
		$(IMAGE_NAME) python /app/src/analysis.py

stop:
	@echo "Stopping container..."
	@docker stop $(CONTAINER_NAME) || true

clean: stop
	@echo "Removing Docker resources..."
	@docker rm -f $(CONTAINER_NAME) 2>/dev/null || true
	@docker rmi -f $(IMAGE_NAME) 2>/dev/null || true
