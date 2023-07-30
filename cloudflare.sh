#!/bin/bash

CLOUDFLARE_IP_RANGES=$(curl https://www.cloudflare.com/ips-v4)

for IP in ${CLOUDFLARE_IP_RANGES[@]}; do
  iptables -I INPUT -p tcp --dport 80 -s $IP -j ACCEPT
  iptables -I INPUT -p tcp --dport 443 -s $IP -j ACCEPT
done

iptables -A INPUT -p tcp --dport 80 -j DROP
iptables -A INPUT -p tcp --dport 443 -j DROP