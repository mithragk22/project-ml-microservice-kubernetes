#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=mithragk22/service-api

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run service-api --image=$dockerpath --port=80


# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

# Wait till container is running
sleep 40

# Step 4:
# Forward the container port to a host
kubectl port-forward service-api 8000:80
