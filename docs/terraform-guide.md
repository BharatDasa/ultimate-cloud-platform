# Terraform Infrastructure Guide

# Overview

Terraform provisions the entire AWS infrastructure stack for Ultimate Cloud Platform.

The infrastructure follows modular enterprise-grade Terraform architecture.

---

# Infrastructure Components

Terraform provisions:

* VPC
* Public Subnets
* Private Subnets
* NAT Gateway
* Internet Gateway
* Route Tables
* Security Groups
* IAM Roles
* EKS Cluster
* EKS Node Groups
* ECR Repositories
* CloudWatch Logging

---

# Terraform Structure

```text
terraform/
│
├── backend.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── locals.tf
├── data.tf
├── main.tf
│
└── modules/
    ├── vpc/
    ├── eks/
    └── ecr/
```

---

# Initialize Terraform

```bash
cd terraform

terraform init
```

---

# Validate Terraform

```bash
terraform validate
```

---

# Format Terraform

```bash
terraform fmt -recursive
```

---

# Review Infrastructure Plan

```bash
terraform plan
```

---

# Deploy Infrastructure

```bash
terraform apply -auto-approve
```

---

# Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

# Terraform Modules

## VPC Module

Responsible for:

* VPC
* Subnets
* Route Tables
* Internet Gateway
* NAT Gateway
* Security Groups

---

## EKS Module

Responsible for:

* EKS Cluster
* Node Groups
* IAM Roles
* OIDC Provider
* Cluster Autoscaler
* Addons

---

## ECR Module

Responsible for:

* Backend repository
* Frontend repository
* Lifecycle policies

---

# Backend State

Terraform backend uses Amazon S3.

Benefits:

* Remote state storage
* State locking
* Team collaboration
* Infrastructure consistency

---

# Best Practices

* Modular architecture
* Remote state storage
* IAM least privilege
* Infrastructure validation
* Reusable modules
* Version locking

---

# Common Commands

## Refresh State

```bash
terraform refresh
```

## Show Outputs

```bash
terraform output
```

## Show State

```bash
terraform state list
```

## Reconfigure Backend

```bash
terraform init -reconfigure
```

---

# Production Engineering Concepts

* Infrastructure as Code
* Immutable Infrastructure
* AWS Automation
* State Management
* Modular Infrastructure
* Cloud Engineering
