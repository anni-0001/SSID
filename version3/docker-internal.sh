#!/bin/bash 

round=1
dir_num=25
while [ $round -le $dir_num ]
do 
    echo round: $round

    mkdir -p /purple/tcpdump/$round 2>&1 | grep -v "mkdir:"
    # timeout SCAN_TIME docker-compose up --build

    tcpdump -i eth0 -w /purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap


    ((round ++))
done &

chmod 700 tmux.sh

if [[ $HOSTNAME -eq "dev1"]]
    ./tmux.sh
    # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap
    # bash tmux.sh

fi
sleep(10000)

./cleanup.sh
