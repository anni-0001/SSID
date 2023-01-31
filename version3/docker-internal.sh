#!/bin/bash 

# hard-coded params
SCAN_TIME=20
RT_DIR="/purple/version3"
TCP_DIR="/purple/tcpdump"

if [ $1 ]
then
    experiment_num=$1
else
    experiment_num=0
fi
if [ $2 ]
then
    scan_time=$2
else
    scan_time=$SCAN_TIME   # default scantime
fi

# I don't understand these purpose...
#experiment_num=$(cat $RT_DIR/round.txt)
#scan_time=$(cat $RT_DIR/scan_time.txt)

echo $experiment_num

if [ "$HOSTNAME" == "dev1" ]; then
    /opt/tmux.sh $experiment_num $scan_time
fi

if [ "$HOSTNAME" == "dev2" ] ||[ "$HOSTNAME" == "dev3" ] || [ "$HOSTNAME" == "dev4" ]; then
    timeout $scan_time tcpdump  -i eth0 -w $TCP_DIR/$experiment_num/$HOSTNAME.pcap
fi