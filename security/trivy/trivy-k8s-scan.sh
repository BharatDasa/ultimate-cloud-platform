#!/bin/bash

echo "===================================="
echo "TRIVY KUBERNETES SCAN"
echo "===================================="

trivy config kubernetes/

echo ""
echo "KUBERNETES SCAN COMPLETED"