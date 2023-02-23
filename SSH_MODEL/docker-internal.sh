#!/bin/bash 

# hard-coded params
FALL_BACK_SCAN_TIME=50
RT_DIR="/purple/version3"
TCP_DIR="/purple/tcpdump"
experiment_num=$(cat /purple/version3/round.txt)

if [ $2 ]
then
    scan_time=$2
else
    scan_time=$FALL_BACK_SCAN_TIME   # default scantime
fi

dev_num=$(cat /purple/version3/dev-num.txt)
echo $dev_num

service ssh restart
echo "alias dev: dev$dev_num"

if [ "$HOSTNAME" == "dev1" ]; then
    echo " [*] Running tmux.sh on $HOSTNAME"
    timeout $scan_time /opt/tmux.sh $experiment_num $scan_time
elif [ "$HOSTNAME" == "dev$dev_num" ]; then
    echo 'alias a="for ((c=1; c<=n-1; c ++)); do echo -n '1'; done; echo hi"' >> ~/.bashrc
    # echo 'function a(){ for ((c=1; c<=n-1; c ++)); do echo -n '1'; done; echo hi}' >> ~/.bashrc
    echo " [*] Running tcpdump on $HOSTNAME"
    timeout $scan_time tcpdump  -i eth0 -U -w $TCP_DIR/$experiment_num/$HOSTNAME.pcap
else
    echo " [*] Running tcpdump on $HOSTNAME"
    timeout $scan_time tcpdump  -i eth0 -U -w $TCP_DIR/$experiment_num/$HOSTNAME.pcap
fi