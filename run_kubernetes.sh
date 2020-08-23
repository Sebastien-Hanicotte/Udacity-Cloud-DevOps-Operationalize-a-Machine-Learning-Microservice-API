#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="chtiseb/udacity_project5:0.1"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run project5 --replicas=5 --image=${dockerpath} --port=80 app=project5 

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/project5 8000:80 


# Get Logs
kubectl logs `kubectl get pods -o=name`
#kubectl expose deployment project5 --type=NodePort --port=8000 --target-port=80 --name=my-project-5
#kubectl expose deployment project5 --type=LoadBalancer --port=8000 --target-port=80 --name=my-project-5
#kubectl expose deployments/project5 --type="NodePort" --port 8000
