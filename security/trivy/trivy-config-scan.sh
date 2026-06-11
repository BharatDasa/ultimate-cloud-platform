#!/bin/bash

echo "===================================="
echo "TRIVY TERRAFORM SCAN"
echo "===================================="

trivy config terraform/

echo ""
echo "TERRAFORM SCAN COMPLETED"