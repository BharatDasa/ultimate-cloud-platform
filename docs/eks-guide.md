# Amazon EKS Guide

# Overview

Ultimate Cloud Platform runs on Amazon Elastic Kubernetes Service (EKS).

EKS provides a managed Kubernetes control plane with enterprise-grade scalability, reliability, and security.

---

# EKS Components

The cluster includes:

* Control Plane
* Managed Node Groups
* CoreDNS
* kube-proxy
* VPC CNI
* EBS CSI Driver
* Metrics Server
* Cluster Autoscaler

---

# Configure kubectl

```bash
aws eks update-kubeconfig \
  --region ap-south-1 \
  --name ultimate-eks-cluster
```

---

# Verify Cluster

```bash
kubectl get nodes
```

---

# Verify Pods

```bash
kubectl get pods -A
```

---

# Verify Services

```bash
kubectl get svc -A
```

---

# Kubernetes Namespaces

Namespaces used:

* apps
* monitoring

---

# Frontend Deployment

Frontend uses:

* Deployment
* Service
* Ingress
* ConfigMap
* HPA

---

# Backend Deployment

Backend uses:

* Deployment
* Service
* ConfigMap
* HPA

---

# Autoscaling

## Horizontal Pod Autoscaler

Automatically scales application pods based on CPU usage.

---

## Cluster Autoscaler

Automatically adds or removes worker nodes.

---

# Monitoring Stack

Installed components:

* Prometheus
* Grafana
* Alertmanager
* Metrics Server

---

# Kubernetes Validation

Run validation:

```bash
kubectl apply \
--dry-run=client \
-f kubernetes/
```

---

# Common Commands

## Watch Pods

```bash
kubectl get pods -A -w
```

## Watch Nodes

```bash
kubectl get nodes -w
```

## Watch HPA

```bash
kubectl get hpa -A -w
```

---

# Rollout Verification

```bash
kubectl rollout status deployment/frontend
```

```bash
kubectl rollout status deployment/backend
```

---

# Engineering Concepts

* Kubernetes Orchestration
* Self-Healing Infrastructure
* Declarative Deployments
* Rolling Updates
* Cloud-Native Architecture
* Kubernetes Networking
* Cluster Operations
