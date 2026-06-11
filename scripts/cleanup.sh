#!/bin/bash

set -e

echo "===================================="
echo "CLEANING KUBERNETES RESOURCES"
echo "===================================="

echo ""
echo "REMOVING APPLICATIONS"
echo ""

kubectl delete -f kubernetes/apps/frontend/ \
--ignore-not-found=true

kubectl delete -f kubernetes/apps/backend/ \
--ignore-not-found=true

echo ""
echo "REMOVING AUTOSCALER"
echo ""

kubectl delete -f kubernetes/autoscaling/ \
--ignore-not-found=true

echo ""
echo "REMOVING MONITORING"
echo ""

helm uninstall prometheus \
-n monitoring || true

helm uninstall grafana \
-n monitoring || true

helm uninstall alertmanager \
-n monitoring || true

echo ""
echo "DELETING NAMESPACES"
echo ""

kubectl delete namespace monitoring \
--ignore-not-found=true

kubectl delete namespace apps \
--ignore-not-found=true

echo ""
echo "WAITING FOR LOAD BALANCERS"
echo ""

sleep 120

echo ""
echo "===================================="
echo "CLEANUP COMPLETED"
echo "===================================="