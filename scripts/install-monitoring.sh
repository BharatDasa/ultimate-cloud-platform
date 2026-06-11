#!/bin/bash

set -e

echo "===================================="
echo "INSTALLING MONITORING STACK"
echo "===================================="

# ============================================
# CREATE NAMESPACE
# ============================================

echo ""
echo "CREATING MONITORING NAMESPACE"
echo ""

kubectl create namespace monitoring \
--dry-run=client -o yaml | kubectl apply -f -

# ============================================
# HELM REPOSITORIES
# ============================================

echo ""
echo "ADDING HELM REPOSITORIES"
echo ""

helm repo add prometheus-community \
https://prometheus-community.github.io/helm-charts

helm repo add grafana \
https://grafana.github.io/helm-charts

helm repo update

# ============================================
# KUBE PROMETHEUS STACK
# ============================================

echo ""
echo "INSTALLING KUBE PROMETHEUS STACK"
echo ""

helm upgrade --install prometheus \
prometheus-community/kube-prometheus-stack \
--namespace monitoring \
-f kubernetes/monitoring/prometheus-values.yaml

# ============================================
# GRAFANA
# ============================================

echo ""
echo "INSTALLING GRAFANA"
echo ""

helm upgrade --install grafana \
grafana/grafana \
--namespace monitoring \
-f kubernetes/monitoring/grafana-values.yaml

# ============================================
# ALERTMANAGER
# ============================================

echo ""
echo "INSTALLING ALERTMANAGER"
echo ""

helm upgrade --install alertmanager \
prometheus-community/alertmanager \
--namespace monitoring \
--set persistence.enabled=false \
--set replicaCount=1

# ============================================
# WAIT FOR PODS
# ============================================

echo ""
echo "WAITING FOR MONITORING PODS"
echo ""

sleep 20

# ============================================
# STATUS
# ============================================

echo ""
echo "===================================="
echo "MONITORING POD STATUS"
echo "===================================="

kubectl get pods -n monitoring

echo ""
echo "===================================="
echo "SERVICES"
echo "===================================="

kubectl get svc -n monitoring

echo ""
echo "===================================="
echo "PVC STATUS"
echo "===================================="

kubectl get pvc -n monitoring

echo ""
echo "===================================="
echo "HELM RELEASES"
echo "===================================="

helm list -n monitoring

echo ""
echo "===================================="
echo "MONITORING STACK INSTALLED"
echo "===================================="
