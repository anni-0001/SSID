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
    mkdir -p /purple/$HOSTNAME/tcpdump/$round 2>&1 | grep -v "mkdir:"
    timeout SCAN_TIME docker-compose up --build



    ((round ++))
done &


