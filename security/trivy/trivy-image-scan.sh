#!/bin/bash

echo "===================================="
echo "TRIVY IMAGE SCAN"
echo "===================================="

trivy image \
913524913728.dkr.ecr.ap-south-1.amazonaws.com/ultimate-platform-frontend:latest

trivy image \
913524913728.dkr.ecr.ap-south-1.amazonaws.com/ultimate-platform-backend:latest

echo ""
echo "IMAGE SCAN COMPLETED"