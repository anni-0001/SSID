#!/bin/bash
dir_num=3
round=1
SCAN_TIME=200

<<comment
    1. make directories : /tcpdump
    2. loop experiments
        build docker contianers with timeout
comment
# timeout 20 docker-compose up --build

while [ $round -le $dir_num ]
do 
    echo round: $round
    sudo -p mkdir tcpdump/$round #2>&1 | grep -v "mkdir:"
    # timeout 100 docker-compose up 
    sleep 5



    ((round ++))
done 


