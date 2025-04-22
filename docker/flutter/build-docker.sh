#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the image name and tag
IMAGE_NAME="thl/flutter"
TAG="latest"

# Build the Docker image
echo "Building Docker image ${IMAGE_NAME}:${TAG}..."
docker build -t ${IMAGE_NAME}:${TAG} .

echo "Docker image ${IMAGE_NAME}:${TAG} built successfully."