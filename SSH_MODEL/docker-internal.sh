#!/bin/bash 

# hard-coded params
FALL_BACK_SCAN_TIME=30
RT_DIR="/home/ubuntu"
TCP_DIR="/purple/tcpdump"
experiment_num=$(cat $RT_DIR/purple/round.txt)
# prixies

if [ $2 ]
then
    scan_time=$2
else
    scan_time=$FALL_BACK_SCAN_TIME   # default scantime
fi

dev_num=$(cat $RT_DIR/purple/dev-num.txt)
proxy=$(cat $RT_DIR/purple/proxy.txt)
# echo $dev_num

# defigning IP addresses
ip=($(/sbin/ifconfig eth0| grep 'inet '))
eth0=${ip[2]}
echo "[*] $HOSTNAME : $eth0"

service ssh restart
# echo "alias dev: dev$dev_num"
# mv /usr/sbin/tcpdump /usr/bin/tcpdump

# ln -s /usr/bin/tcpdump /usr/sbin/tcpdump

# netem starting with a random dely between 15 and 35
# sudo chmod 777 -R /purple/tcpdump/


# # logic for multiple proxies
# for ((x=2; x<=proxy; x++ )); do
#     if [ "$HOSTNAME" == "dev$x" ]; then
#         tc qdisc add dev eth0 root handle 1:0 netem delay 100ms 10ms
#         sudo timeout $scan_time tcpdump -Z root -i eth0 -U -w $RT_DIR/purple/tcpdump/$experiment_num/$HOSTNAME.pcap
#     fi
# done


if [ "$HOSTNAME" == "dev1" ]; then
    echo " [*] Running tmux.sh on $HOSTNAME"
    tc qdisc add dev eth0 root handle 1:0 netem delay 1ms 10ms
    timeout $scan_time /opt/tmux.sh $experiment_num $scan_time
else
    echo 'alias a="for ((c=1; c<n-1; c ++)); do echo -n '1'; done; echo hi"' >> ~/.bashrc
    echo " [*] Running tcpdump on $HOSTNAME"
    sudo timeout $scan_time tcpdump -Z root -i eth0 -U -w $RT_DIR/purple/tcpdump/$experiment_num/$HOSTNAME.pcap
fi


# sort pickle file data by what is above 1
    # look at data

# make netem super high delay & look at network traffic
# start crawl 10k - sample for friday


