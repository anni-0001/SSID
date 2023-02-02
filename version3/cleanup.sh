#!/bin/bash

<< comment

This is a simple script for cleaning up folders& docker containers after experiemts
Helpful before a push to github to reduce unneeded data

comment


i=1
while [ $i -le 25 ]
do
    echo "removing folder ${i}"
    # rm -rf tcpdump/$i
    sudo rm -rf /home/amc1100/Documents/research/SSID/tcpdump/$i

    
    ((i++))
done 

# docker ps -qa|xargs docker rm -f
