#!/bin/bash

dir_num=25
round=1
SCAN_TIME=300

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
    echo round: $round
    mkdir /purple/tcpdump/$round 
    # mkdir -p /purple/tcpdump/$round 2>&1 | grep -v "mkdir:"
    # timeout SCAN_TIME docker-compose up --build

    # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap


    ((round ++))
done &

round=1
for ((i=1; i<=dir_num; i++))
do
# export round
# sudo timeout $SCAN_TIME docker-compose up --build
echo "$i" >round.txt
done
# while [ $round -le $dir_num ]
# do 
#     # timeout 200 sudo docker-compose up --build
#     sudo docker-compose up --build
#     # echo "in while loop"
#     # sleep 1000

#     ((round ++))
# done &

# ./cleanup.sh

# mkdir -p ../tcpdump/$round 
# sudo docker-compose up 


# while [ $round -eq $dir_num ]
# do 
#     echo round: $round
# sudo -p mkdir tcpdump/$round #2>&1 | grep -v "mkdir:"
#     docker-compose up 
#     sleep 5



#     ((round ++))
# done 


