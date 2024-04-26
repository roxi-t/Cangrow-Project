#!/bin/bash

# Docker Compose file name
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Directory path
DIRECTORY_PATH="section3"

# Check if Docker Compose file exists
if [ ! -f "$DIRECTORY_PATH/$DOCKER_COMPOSE_FILE" ]; then
    echo "Error: Docker Compose file not found!"
    exit 1
fi

# Navigate to the directory
cd "$DIRECTORY_PATH" || exit 1

# Run the Docker Compose project
echo "Running the Docker Compose project..."
docker-compose up -d
