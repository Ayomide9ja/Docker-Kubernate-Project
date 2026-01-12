#!/bin/bash

# Stop immediately if any command fails
set -e

echo "==============================="
echo "Starting Kubernetes cleanup..."
echo "==============================="

# 1️⃣ Delete Ingress
if [ -f ingress.yaml ]; then
    echo "Deleting ingress..."
    kubectl delete -f ingress.yaml --ignore-not-found
else
    echo "No ingress.yaml found, skipping ingress cleanup"
fi

# 2️⃣ Delete Backend app deployment
if [ -f backend-manifest ]; then
    echo "Deleting backend app deployment..."
    kubectl delete -f backend-manifest --ignore-not-found
else
    echo "No backend-manifest found, skipping backend cleanup"
fi

# 3️⃣ Delete MongoDB deployment
if [ -f mongodb-manifest ]; then
    echo "Deleting MongoDB deployment..."
    kubectl delete -f mongodb-manifest --ignore-not-found
else
    echo "No mongodb-manifest found, skipping MongoDB cleanup"
fi

# 4️⃣ Delete Namespace (optional)
if [ -f namespace.yaml ]; then
    echo "Deleting namespace..."
    kubectl delete -f namespace.yaml --ignore-not-found
else
    echo "No namespace.yaml found, skipping namespace cleanup"
fi

# 5️⃣ Verify cleanup
echo "==============================="
echo "Kubernetes resources after cleanup:"
kubectl get pods --all-namespaces
kubectl get svc --all-namespaces
kubectl get ingress --all-namespaces
echo "==============================="
echo "Kubernetes cleanup completed successfully!"
