#!/bin/bash

TOTAL_ROUNDS=150
SCAN_TIME=100
HOME_DIR=/home/amc1100/Documents/research/SSID/tcpdump

round=1
# look into building docker image

while [ $round -le $TOTAL_ROUNDS ]
do
    echo $round > round.txt
    # echo "memory: ${free -m}"
    # create docker-compose.yml script
    #   arg1: count of stepping-stones
    #   arg2: experiment number
    #   arg3: timeout length
    #   arg4: path root directory of the project
    # bash compose-bash.sh 2 $round $SCAN_TIME $RT_DIR

    echo " [*] Running round $round..."
   
    # create exp tcpdump dir
    sudo mkdir -p ${HOME_DIR}/${round}

    # start up docker containers
    docker-compose up --build
    # sleep $SCAN_TIME + $
    docker wait dev1
    echo " [*] dev1 exited"
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    sleep 30
    # increase sleep for overnight


    ((round ++))
done &
sleep 5

echo " [*] docker-external.sh finished -- $round experiments complete"






