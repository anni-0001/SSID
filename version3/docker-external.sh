#!/bin/bash

TOTAL_ROUNDS=1
SCAN_TIME=100
RT_DIR=/home/nate/SSID

round=1
while [ $round -le $TOTAL_ROUNDS ]
do 
    # create docker-compose.yml script
    #   arg1: count of stepping-stones
    #   arg2: experiment number
    #   arg3: timeout length
    #   arg4: path root directory of the project
    bash compose-bash.sh 2 $round $SCAN_TIME $RT_DIR

    echo "Running round $round..."
   
    # create exp tcpdump dir
    mkdir -p ${RT_DIR}/tcpdump/${round}

    # start up docker containers
    docker-compose up --build

    # sleep 5 - find better method to wait until all contianers dead

    ((round ++))
done &
sleep 5

# when dockercompose tunrs on -sleep for scantime





