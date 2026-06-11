#!/bin/bash

echo "===================================="
echo "TRIVY FILESYSTEM SCAN"
echo "===================================="

trivy fs .

echo ""
echo "FILESYSTEM SCAN COMPLETED"