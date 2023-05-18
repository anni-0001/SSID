#!/bin/bash

# creates the  config file for ssh session & key management


# establishing variables
devices=$1
echo $devices
sshfile=config
devices=$(cat dev-num.txt)

start_ip=1


# need to reserve 172.18.0.0,1 in config ips ssh

echo " " > $sshfile
for((i=1; i<=devices; i++)); do
    # reserves 172.18.0.0,1 in config ips ssh
    dev_ip=$(($devices-$i))
    ip=$(($dev_ip +2))

    echo "Host dev$i" >> $sshfile
    # echo "Hostname 172.18.0.$ip" >> $sshfile
    echo "Hostname 172.10.10.10$start_ip" >> $sshfile
    echo "StrictHostKeyChecking no" >> $sshfile
    echo "IdentityFile ~/.ssh/id_rsa" >> $sshfile
    echo "UserKnownHostsFile=/dev/null" >> $sshfile
    echo "User root" >> $sshfile
    echo " " >>$sshfile
    start_ip=$((start_ip + 1))
done