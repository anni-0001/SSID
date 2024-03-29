#!/bin/bash 

# hard-coded params
RT_DIR="/home/ubuntu"
TCP_DIR="/purple/tcpdump"
experiment_num=$(cat $RT_DIR/purple/round.txt)
scan_time=$(cat $RT_DIR/purple/scan_time.txt)
dev_num=$(cat $RT_DIR/purple/dev-num.txt)
proxy=$(cat $RT_DIR/purple/proxy.txt)

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

<< **
logic for multiple proxies when we want to implement them

# for ((x=2; x<=proxy; x++ )); do
#     if [ "$HOSTNAME" == "dev$x" ]; then
#         tc qdisc add dev eth0 root handle 1:0 netem delay 100ms 10ms
#         sudo timeout $scan_time tcpdump -Z root -i eth0 -U -w $RT_DIR/purple/tcpdump/$experiment_num/$HOSTNAME.pcap
#     fi
# done
**



if [ "$HOSTNAME" == "dev1" ]; then
    echo " [*] Running tmux.sh on $HOSTNAME"
    tc qdisc add dev eth0 root handle 1:0 netem delay 1ms 10ms
    timeout $scan_time /opt/tmux.sh $experiment_num $scan_time
else
    echo 'alias a="for ((c=1; c<n-1; c ++)); do echo -n '1'; done;"' >> ~/.bashrc
    echo " [*] Running tcpdump on $HOSTNAME"
    sudo timeout $scan_time tcpdump -Z root -i eth0 -U -w $RT_DIR/purple/tcpdump/$experiment_num/$HOSTNAME.pcap
fi



