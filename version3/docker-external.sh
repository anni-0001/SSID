#!/bin/bash

dir_num=25
round=1
SCAN_TIME=60

<<comment
    1. make directories : /tcpdump
    2. loop experiments
        build docker contianers with timeout
comment
# need a loop of docker-internal so that I can loop the experiments and clear without mess

# updates the container 

# write into file every new round and then containers use that as the refrence of round


round=1
dir_num=25
while [ $round -le $dir_num ]
do 
   
    mkdir /home/amc1100/Documents/research/SSID/tcpdump/$round 
    timeout $SCAN_TIME docker-compose up --build

    # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap


    ((round ++))
done &
sleep 5
# experiment_num=$(cat round.txt)
# echo $experiment_num

# round=1
# for ((i=1; i<=dir_num; i++))
# do
#     # export round
#     echo "$i" >round.txt
#     experiment_num=$(cat round.txt)
#     sudo timeout $SCAN_TIME docker-compose up --build

#     echo $experiment_num
#     sleep 2
# done


# ./cleanup.sh

# mkdir -p ../tcpdump/$round 
# sudo docker-compose up 





