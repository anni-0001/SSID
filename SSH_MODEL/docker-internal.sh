#!/bin/bash 

# hard-coded params
FALL_BACK_SCAN_TIME=50
RT_DIR="/home/ubuntu"
TCP_DIR="/purple/tcpdump"
experiment_num=$(cat $RT_DIR/purple/round.txt)

if [ $2 ]
then
    scan_time=$2
else
    scan_time=$FALL_BACK_SCAN_TIME   # default scantime
fi

dev_num=$(cat $RT_DIR/purple/dev-num.txt)
# echo $dev_num

# echo "ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{print $1}'"
ip=($(/sbin/ifconfig eth0| grep 'inet '))
eth0=$ip[2]
echo "[*] $HOSTNAME : $eth0"

service ssh restart
# echo "alias dev: dev$dev_num"
# mv /usr/sbin/tcpdump /usr/bin/tcpdump

# ln -s /usr/bin/tcpdump /usr/sbin/tcpdump

# netem starting with a random dely between 15 and 35
tc qdisc add dev eth0 root handle 1:0 netem delay 25ms 10ms
# sudo chmod 777 -R /purple/tcpdump/

if [ "$HOSTNAME" == "dev1" ]; then
    echo " [*] Running tmux.sh on $HOSTNAME"
    timeout $scan_time /opt/tmux.sh $experiment_num $scan_time
elif [ "$HOSTNAME" == "dev$dev_num" ]; then
    echo 'alias a="for ((c=1; c<n-1; c ++)); do echo -n '1'; done; echo hi"' >> ~/.bashrc
    # echo 'function a(){ for ((c=1; c<=n-1; c ++)); do echo -n '1'; done; echo hi}' >> ~/.bashrc
    echo " [*] Running tcpdump on $HOSTNAME"
    sudo timeout $scan_time tcpdump -Z root -i eth0 -U -w $RT_DIR/purple/tcpdump/$experiment_num/$HOSTNAME.pcap
else
    echo " [*] Running tcpdump on $HOSTNAME"
    sudo timeout $scan_time tcpdump -Z root -i eth0 -U -w $RT_DIR/purple/tcpdump/$experiment_num/$HOSTNAME.pcap
fi


