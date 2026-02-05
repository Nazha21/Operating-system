#!/bin/bash
echo "=== System Health Snapshot ==="
echo "Date/Time : $(date)"
echo "Hostname  : $(hostname)"
echo "User      : $(whoami)"
echo ""
echo "Disk Usage (/):"
df -h / | awk 'NR==1 || NR==2 {print}'
