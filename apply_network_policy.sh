#!/bin/bash
set -e

# Allow egress traffic only to 8.8.8.8 in the namespace
sudo ip netns exec custom_ns iptables -A OUTPUT -d 8.8.8.8 -j ACCEPT
sudo ip netns exec custom_ns iptables -A OUTPUT -j DROP

echo "Egress policy applied: only traffic to 8.8.8.8 is allowed."
