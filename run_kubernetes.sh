#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="chtiseb/udacity_project5:0.1"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run --image=${dockerpath} project5 --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment project5 --type=LoadBalancer --port=8000 --target-port=80
#kubectl expose deployments/project5 --type="NodePort" --port 8000
