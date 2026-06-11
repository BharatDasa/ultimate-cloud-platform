#!/bin/bash

set -e

echo "===================================="
echo "CLUSTER VALIDATION"
echo "===================================="

echo ""
echo "KUBERNETES NODES"
echo ""

kubectl get nodes -o wide

echo ""
echo "ALL PODS"
echo ""

kubectl get pods -A

echo ""
echo "SERVICES"
echo ""

kubectl get svc -A

echo ""
echo "DEPLOYMENTS"
echo ""

kubectl get deployments -A

echo ""
echo "HPA STATUS"
echo ""

kubectl get hpa -A

echo ""
echo "INGRESS STATUS"
echo ""

kubectl get ingress -A

echo ""
echo "MONITORING PODS"
echo ""

kubectl get pods -n monitoring

echo ""
echo "EVENTS"
echo ""

kubectl get events -A --sort-by=.metadata.creationTimestamp

echo ""
echo "===================================="
echo "VALIDATION COMPLETED"
echo "===================================="