#!/bin/bash
set -e

echo "Testing connectivity to 8.8.8.8 from 'custom_ns'..."
sudo ip netns exec custom_ns ping -c 4 8.8.8.8

echo "Testing connectivity to 1.1.1.1 (should fail)..."
if sudo ip netns exec custom_ns ping -c 4 1.1.1.1; then
    echo "ERROR: Network policy not enforced."
else
    echo "Network isolation confirmed: traffic to 1.1.1.1 blocked."
fi
