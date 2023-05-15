#!/bin/bash
devices=4
sshtunnel=" "
for ((i=2; i<=devices-1; i++)); do
    sshtunnel+="ssh -A -t -p $port root@dev$i "
done 