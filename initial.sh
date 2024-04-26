#!/bin/bash

# Script to run a Docker Compose project from a specific directory.

# Variables
DOCKER_COMPOSE_FILE="docker-compose.yml"
DIRECTORY_PATH="section3"

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check for Docker and Docker Compose installation
if ! command_exists docker || ! command_exists docker-compose; then
  echo "Error: Docker and Docker Compose are required but not installed."
  exit 2
fi

# Check if Docker Compose file exists
if [ ! -f "$DIRECTORY_PATH/$DOCKER_COMPOSE_FILE" ]; then
  echo "Error: Docker Compose file not found at $DIRECTORY_PATH/$DOCKER_COMPOSE_FILE!"
  exit 3
fi

# Navigate to the directory
cd "$DIRECTORY_PATH" || { echo "Error: Failed to navigate to directory $DIRECTORY_PATH"; exit 4; }

# Run the Docker Compose project
echo "Running the Docker Compose project..."
docker-compose up -d
