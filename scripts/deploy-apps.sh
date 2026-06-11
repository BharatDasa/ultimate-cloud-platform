#!/bin/bash

set -e

echo "===================================="
echo "ULTIMATE CLOUD PLATFORM DEPLOYMENT"
echo "===================================="

AWS_REGION="ap-south-1"
AWS_ACCOUNT_ID="913524913728"

# ============================================
# ECR LOGIN
# ============================================

echo ""
echo "===================================="
echo "ECR LOGIN"
echo "===================================="

aws ecr get-login-password --region $AWS_REGION | docker login \
--username AWS \
--password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# ============================================
# BUILD + PUSH FRONTEND
# ============================================

echo ""
echo "===================================="
echo "BUILDING FRONTEND"
echo "===================================="

cd apps/frontend

docker build -t ultimate-platform-frontend .

docker tag ultimate-platform-frontend:latest \
$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ultimate-platform-frontend:latest

docker push \
$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ultimate-platform-frontend:latest

cd ../..

# ============================================
# BUILD + PUSH BACKEND
# ============================================

echo ""
echo "===================================="
echo "BUILDING BACKEND"
echo "===================================="

cd apps/backend

docker build -t ultimate-platform-backend .

docker tag ultimate-platform-backend:latest \
$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ultimate-platform-backend:latest

docker push \
$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/ultimate-platform-backend:latest

cd ../..

# ============================================
# CREATE NAMESPACES
# ============================================

echo ""
echo "===================================="
echo "CREATING NAMESPACES"
echo "===================================="

kubectl apply -f kubernetes/namespaces/

# ============================================
# DEPLOY FRONTEND
# ============================================

echo ""
echo "===================================="
echo "DEPLOYING FRONTEND"
echo "===================================="

kubectl apply -f kubernetes/apps/frontend/

# ============================================
# DEPLOY BACKEND
# ============================================

echo ""
echo "===================================="
echo "DEPLOYING BACKEND"
echo "===================================="

kubectl apply -f kubernetes/apps/backend/

# ============================================
# RESTART DEPLOYMENTS
# ============================================

echo ""
echo "===================================="
echo "RESTARTING DEPLOYMENTS"
echo "===================================="

kubectl rollout restart deployment/frontend -n apps

kubectl rollout restart deployment/backend -n apps

# ============================================
# WAIT FOR ROLLOUT
# ============================================

echo ""
echo "===================================="
echo "WAITING FOR FRONTEND ROLLOUT"
echo "===================================="

kubectl rollout status deployment/frontend -n apps

echo ""
echo "===================================="
echo "WAITING FOR BACKEND ROLLOUT"
echo "===================================="

kubectl rollout status deployment/backend -n apps

# ============================================
# STATUS CHECKS
# ============================================

echo ""
echo "===================================="
echo "DEPLOYMENT STATUS"
echo "===================================="

kubectl get deployments -n apps

echo ""
echo "===================================="
echo "POD STATUS"
echo "===================================="

kubectl get pods -n apps -o wide

echo ""
echo "===================================="
echo "SERVICE STATUS"
echo "===================================="

kubectl get svc -n apps

echo ""
echo "===================================="
echo "INGRESS STATUS"
echo "===================================="

kubectl get ingress -n apps

echo ""
echo "===================================="
echo "HPA STATUS"
echo "===================================="

kubectl get hpa -n apps

echo ""
echo "===================================="
echo "APPLICATIONS DEPLOYED SUCCESSFULLY"
echo "===================================="
