#!/bin/sh
# This script deletes a specific iptables rule from the nat table.
# Usage: ./del_iptables_rule.sh
# Ensure the script is run with root privileges
# Check if the script is run as root
iptables -t nat -D PREROUTING 1
