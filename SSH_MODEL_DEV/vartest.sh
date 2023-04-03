#!/bin/bash

# Accessing aliases to use in script
cat ~/.bashrc > myalias.txt
source myalias.txt 
shopt -s expand_aliases

# Call the Python script and capture the output into a Bash array
output=($(python3 p_script.py))

# Assign the array elements to individual Bash variables
burst_total="${output[0]}"
bytes_recieved="${output[1]}"
bytes_send="${output[2]}"
burst_sleep="${output[3]}"

# Use the Bash variables in other commands
echo "burst_total: $burst_total"
echo "bytes_recieved: $bytes_recieved"
echo "bytes_send: $bytes_send"
echo "burst_sleep: $burst_sleep"

s_attacker=""

# creating arbitrary attacker send string
for ((z=1; z<=bytes_send-19; z ++)); do
    s_attacker+="x"
done


for((b=1; b <=burst_total; b++)); do
    # put into tmux send keys:
    tmux sendkeys -t mySession 'n=$bytes_recieved; a; echo $s_attacker'
    sleep $burst_sleep

done 





