#!/bin/bash

dir_num=3
round=1
SCAN_TIME=200

<<comment
    1. make directories : /tcpdump
    2. loop experiments
        build docker contianers with timeout
comment

# updates the container 
sudo timeout 30 docker-compose up --build

mkdir -p ../tcpdump/$round 
sudo docker-compose up


# while [ $round -eq $dir_num ]
# do 
#     echo round: $round
# sudo -p mkdir tcpdump/$round #2>&1 | grep -v "mkdir:"
#     docker-compose up 
#     sleep 5



#     ((round ++))
# done 


