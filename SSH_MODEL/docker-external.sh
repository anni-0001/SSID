#!/bin/bash
TOTAL_ROUNDS=2 
SCAN_TIME=300
devices=4
# TCP_DIR=/home/amc1100/Documents/research/SSID/SSH_MODEL/tcpdump
TCP_DIR=/Users/annika/Documents/SSID/SSH_MODEL/tcpdump
VERSION_DIR=SSH_MODEL

round=1
# look into building standard docker image

if [ $# -eq 0 ]; then 

    echo " "
    # read -p "Enter min number of devices: " min_devices
    read -p "Enter max number of devices: " max_devices
    read -p "Enter scan duration in seconds: " SCAN_TIME
    read -p "Enter experiment rounds: " TOTAL_ROUNDS
else 

    if [ "$1" == "static" ]; then 
        TOTAL_ROUNDS=2
        SCAN_TIME=300
        devices=4
    else
        # min_devices=
        max_devices=$1
        SCAN_TIME=$2                                                                                                                                                                                                                                                                                                                                              
        TOTAL_ROUNDS=$3        
    fi
fi

# devices=p_sleep=$(( $RANDOM % $max_devices + 4 ))


# configutaions for:
#     - ssh config   
#     - uniform device numbers in dev-num.txt
#     - docker-compose
#     - uniform SCAN_TIME

# creates automated ssh config for x number of devices
echo ""
echo "CONFIGURATIONS"
echo "Rounds: $TOTAL_ROUNDS"
echo "SCAN_TIME: $SCAN_TIME"
echo "Device Number Range: 3 - $max_devices"
echo ""
sleep 5



# makes uniform scan_time vars in .env for all experiements
# sed -i "1c\\SCAN_TIME=$SCAN_TIME" .env

while [ $round -le $TOTAL_ROUNDS ]
do
    sudo service docker restart


    # devices=$(( $RANDOM % $max_devices + 4 ))
    devices=$(shuf -i 3-$max_devices -n 1)

    # echos current round into round.txt for uniform variable useage
    echo $round > round.txt

    # creates uniform device number/ central value for all dependent files
    echo $devices > dev-num.txt

    # creates automated docker-compose.yml
    bash compose-bash.sh $devices
    bash ssh-config.sh $devices

    
    echo " [*] Running round $round..."
   
    # create exp tcpdump dir

    echo " [*] making directory: $round"
    mkdir -p ${TCP_DIR}/${round}
    chmod 777 ${TCP_DIR}/${round}


    # start up docker containers
    docker-compose up --build
    
    # # wait till dev1 is done 
    docker wait dev1
    sleep 10
    echo " [*] dev1 exited"
    echo " [*] stopping & removing containers"

    # stop and delete all active containers
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    sleep 3
    # increase sleep for overnight


    ((round ++))
done 
sleep 5

# gets correct # of rounds run
finalround=$(cat round.txt)

echo " [*] docker-external.sh finished -- $finalround experiments complete"
