#!/bin/bash 

round=1
dir_num=25
while [ $round -le $dir_num ]
do 
    echo round: $round

    mkdir -p /purple/tcpdump/$round 2>&1 | grep -v "mkdir:"
    # timeout SCAN_TIME docker-compose up --build

    # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap


    ((round ++))
done &

# chmod 700 /usr/local/sbin/tmux.sh
dir_num =25
experiment=1
while [ $experiment -le $dir_num ]
do 
    if [ "$HOSTNAME" == "dev1" ]; then
        export round

        ./usr/local/sbin/tmux.sh
        # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap
        # bash tmux.sh

    fi &
    sleep 15
 

    # ./cleanup.sh
    docker ps -qa|xargs docker rm -f

    ((experiment ++))

done