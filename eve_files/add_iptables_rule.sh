#!/bin/sh
#this script adds a specific iptables rule to the nat table.
# Usage: ./add_iptables_rule.sh
# Ensure the script is run with root privileges
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
