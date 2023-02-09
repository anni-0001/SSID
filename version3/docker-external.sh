#!/bin/bash
TOTAL_ROUNDS=2
SCAN_TIME=300
devices=4
TCP_DIR=/home/amc1100/Documents/research/SSID/tcpdump
VERSION_DIR=version3

round=1
# look into building standard docker image

# << comment 
# configutaions for 
#     - ssh config   
#     - uniform device numbers in dev-num.txt
#     - docker-compose
#     - uniform SCAN_TIME
# comment 

# creates automated ssh config for x number of devices
bash ssh-config.sh $devices

# creates uniform device number/ central value for all dependent files
echo $devices > dev-num.txt

# creates automated docker-compose.yml
bash compose-bash.sh $devices

# makes uniform scan_time vars in .env for all experiements
sed -i "1c\\SCAN_TIME=$SCAN_TIME" .env

while [ $round -le $TOTAL_ROUNDS ]
do
    # echos current round into round.txt for uniform variable useage
    echo $round > round.txt

    # create docker-compose.yml script
    #   arg1: count of stepping-stone devices
    bash compose-bash.sh $devices

    echo " [*] Running round $round..."
   
    # create exp tcpdump dir

    echo " [*] making directory: $round"
    sudo mkdir -p ${TCP_DIR}/${round}

    # start up docker containers
    docker-compose up --build
    
    # wait till dev1 is done 
    docker wait dev1
    echo " [*] dev1 exited"
    echo " [*] stopping & removing containers"

    # stop and delete all active containers
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






