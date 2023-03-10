#!/bin/bash 

# hard-coded params
FALL_BACK_SCAN_TIME=50
RT_DIR="purple/"
TCP_DIR="/purple/tcpdump"
experiment_num=$(cat /purple/round.txt)

if [ $2 ]
then
    scan_time=$2
else
    scan_time=$FALL_BACK_SCAN_TIME   # default scantime
fi

dev_num=$(cat /purple/dev-num.txt)
# echo $dev_num

service ssh restart
# echo "alias dev: dev$dev_num"


# netem starting with a random dely between 15 and 35
tc qdisc add dev eth0 root handle 1:0 netem delay 25ms 10ms


if [ "$HOSTNAME" == "dev1" ]; then
    echo " [*] Running tmux.sh on $HOSTNAME"
    timeout $scan_time /opt/tmux.sh $experiment_num $scan_time
elif [ "$HOSTNAME" == "dev$dev_num" ]; then
    echo 'alias a="for ((c=1; c<n-1; c ++)); do echo -n '1'; done; echo hi"' >> ~/.bashrc
    # echo 'function a(){ for ((c=1; c<=n-1; c ++)); do echo -n '1'; done; echo hi}' >> ~/.bashrc
    echo " [*] Running tcpdump on $HOSTNAME"
    sudo timeout $scan_time tcpdump  -i eth0 -U -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap
else
    echo " [*] Running tcpdump on $HOSTNAME"
    sudo  timeout $scan_time tcpdump  -i eth0 -U -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap
fi


