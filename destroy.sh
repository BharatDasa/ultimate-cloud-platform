#!/bin/bash

set -e

echo "===================================="
echo "DESTROYING INFRASTRUCTURE"
echo "===================================="

cd terraform

terraform init -reconfigure

terraform destroy -auto-approve

echo "===================================="
echo "INFRASTRUCTURE DESTROYED"
echo "===================================="
