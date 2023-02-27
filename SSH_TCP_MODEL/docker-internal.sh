#!/bin/bash 

# hard-coded params
FALL_BACK_SCAN_TIME=500
RT_DIR="/purple/SSH_TCP_MODEL"
TCP_DIR="/purple/tcpdump"
experiment_num=$(cat /purple/SSH_TCP_MODEL/round.txt)
dev_num=$(cat /purple/SSH_TCP_MODEL/dev-num.txt)


if [ $2 ]
then
    scan_time=$2
else
    scan_time=$FALL_BACK_SCAN_TIME   # default scantime
fi

service ssh restart
echo "alias dev: dev$dev_num"

if [ "$HOSTNAME" == "dev1" ]; then
    echo " [*] Running tmux.sh on $HOSTNAME"
    timeout $scan_time /opt/tmux.sh $experiment_num $scan_time
elif [ "$HOSTNAME" == "dev$dev_num" ]; then
    echo 'alias a="for ((c=1; c<=n-1; c ++)); do echo -n '1'; done; echo hi"' >> ~/.bashrc
    echo " [*] Running tcpdump on $HOSTNAME"
    timeout $scan_time tcpdump  -i eth0 -U -w $TCP_DIR/$experiment_num/$HOSTNAME.pcap
else
    echo " [*] Running tcpdump on $HOSTNAME"
    timeout $scan_time tcpdump  -i eth0 -U -w $TCP_DIR/$experiment_num/$HOSTNAME.pcap
fi