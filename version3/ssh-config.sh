#!/bin/bash

devices=$1
sshfile=config

echo " " > $sshfile
for((i=1; i<=devices; i++)); do
    ip=$((i+1))
    echo "Host dev$i" >> $sshfile
    echo "Hostname 172.18.0.$ip" >> $sshfile
    echo "StrictHostKeyChecking no" >> $sshfile
    echo "IdentityFile ~/.ssh/id_rsa" >> $sshfile
    echo "UserKnownHostsFile=/dev/null" >> $sshfile
    echo "User root" >> $sshfile
    echo " " >>$sshfile
done