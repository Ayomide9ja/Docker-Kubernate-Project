#!/bin/bash

# Stop immediately if any command fails
set -e

echo "==============================="
echo "Starting Docker image build..."
echo "==============================="

# 1️⃣ Pull official Redis image
REDIS_IMAGE="redis:7.2"
echo "Pulling Redis image: $REDIS_IMAGE"
docker pull $REDIS_IMAGE

# 2️⃣ Pull MongoDB image
MONGO_IMAGE="mongo:6"
echo "Pulling MongoDB image: $MONGO_IMAGE"
docker pull $MONGO_IMAGE

# 3️⃣ Pull Mongo Express image
MONGOEXP_IMAGE="mongo-express:1.0.2"
echo "Pulling Mongo Express image: $MONGOEXP_IMAGE"
docker pull $MONGOEXP_IMAGE

# 4️⃣ Pull Redis Commander image
REDISCOMM_IMAGE="rediscommander/redis-commander:latest"
echo "Pulling Redis Commander image: $REDISCOMM_IMAGE"
docker pull $REDISCOMM_IMAGE

# 5️⃣ Build MuchTodo backend app image
APP_IMAGE="muchtodo-app:latest"
echo "Building MuchTodo backend app image: $APP_IMAGE"
docker build -t $APP_IMAGE .

echo "==============================="
echo "All Docker images are ready!"
echo "==============================="

# Optional: show all images built
docker images | grep -E "muchtodo-app|redis|mongo|mongo-express|redis-commander"
