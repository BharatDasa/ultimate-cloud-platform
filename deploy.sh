#!/bin/bash

set -e

echo "===================================="
echo "DEPLOYING TERRAFORM INFRASTRUCTURE"
echo "===================================="

cd terraform

terraform init

terraform validate

terraform plan

terraform apply -auto-approve

cd ..

echo "===================================="
echo "UPDATING KUBECONFIG"
echo "===================================="

aws eks update-kubeconfig `
--region ap-south-1 `
--name ultimate-eks-cluster

kubectl get nodes

echo "===================================="
echo "DEPLOYMENT FINISHED"
echo "===================================="
