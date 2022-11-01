#!/bin/bash


# ipaddress array
declare -a arrVar
arrVar=()
port=22
user=root

filename="/tcpdump/devaddr.txt"
IFS=":"
while read -r line; do

    dev=$(echo "$line" | cut -d ":" -f2)

    arrVar+=("$dev")

done < "ips.txt" 
echo "${arrVar[@]}"

ssh -A -t -p $port $user@${arrVar[0]} ssh -A -t -p $port $user@${arrVar[1]} ssh -A -t -p $port $user@${arrVar[2]} ssh -A -t -p $port $user@${arrVar[3]} #ssh -A -p $port $user@${arrVar[4]}

# for i in "$@"; do


# send data over arbitrary commands from dev4 - automate a way to print to stdin/stdout
# wrap into utility or directly into with ssh (using pipes?)

