#!/bin/bash
dir_num=25
round=1
SCAN_TIME=200

<<comment
    1. make directories : /tcpdump
    2. loop experiments
        build docker contianers with timeout
comment

while [ $round -le $dir_num ]
do 
    echo round: $round
    mkdir -p /purple/$HOSTNAME/tcpdump/$round 2>&1 | grep -v "mkdir:"
    timeout 35 docker-compose up --build
    sleep 5



    ((round ++))
done &


