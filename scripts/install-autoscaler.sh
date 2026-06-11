#!/bin/bash

set -e

echo "===================================="
echo "INSTALLING METRICS SERVER"
echo "===================================="

kubectl apply -f kubernetes/autoscaling/metrics-server.yaml

echo ""
echo "WAITING FOR METRICS SERVER"
echo ""

sleep 20

echo ""
echo "INSTALLING CLUSTER AUTOSCALER"
echo ""

kubectl apply -f kubernetes/autoscaling/cluster-autoscaler.yaml

echo ""
echo "AUTOSCALING INSTALLED"
echo ""

kubectl get pods -n kube-system