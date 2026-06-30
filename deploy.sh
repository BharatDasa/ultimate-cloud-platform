#!/bin/bash

set -e

aws s3 mb s3://ultimate-platform-terraform-state --region ap-south-1

aws dynamodb create-table `
--table-name ultimate-platform-terraform-lock `
--attribute-definitions AttributeName=LockID,AttributeType=S `
--key-schema AttributeName=LockID,KeyType=HASH `
--billing-mode PAY_PER_REQUEST `
--region ap-south-1


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
