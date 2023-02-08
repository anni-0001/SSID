#!/bin/bash

TOTAL_ROUNDS=2
SCAN_TIME=100
devices=4
TCP_DIR=/home/amc1100/Documents/research/SSID/tcpdump
VERSION_DIR=version3

round=1
# look into building standard docker image

# creates automated ssh config for x number of devices
bash ssh-config.sh $devices
echo $devices > dev-num.txt

bash compose-bash.sh $devices


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
    bash compose-bash.sh $devices

    echo " [*] Running round $round..."
   
    # create exp tcpdump dir
    sudo mkdir -p ${TCP_DIR}/${round}

    # start up docker containers
    docker-compose up --build
    # sleep $SCAN_TIME + $
    docker wait dev1
    echo " [*] dev1 exited"
    echo " [*] stopping & removing containers"
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    sleep 30
    # increase sleep for overnight


    ((round ++))
done 
sleep 5

# gets correct # of rounds run
finalround=$(cat round.txt)

echo " [*] docker-external.sh finished -- $finalround experiments complete"






