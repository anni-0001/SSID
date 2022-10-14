#!/bin/bash

service ssh start

# grab ip address
ipaddr=$(/sbin/ifconfig eth0 | grep 'inet')
# $ipaddr[2]
echo "${HOSTNAME} : ${ipaddr}[0]" >> purple/$HOSTNAME/tcpdump/devaddr.txt

round=1 
while [ $round -le 25 ]
do 
    mkdir purple/$HOSTNAME/tcpdump/$round
    # touch purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap

    # cd $round
    touch a_file.txt
    # timeout 500 tcpdump -i eth0 -w purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap

    # cd ..
    # $round ++
    # round=$((round ++))
    ((round ++))
done &

while [ $round -le 25 ]
do 
    # mkdir purple/$HOSTNAME/tcpdump/$round
    # touch purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap

    # cd $round
    # touch a_file.txt
    timeout 30 tcpdump -i eth0 -w purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap

    # cd ..
    # $round ++
    # round=$((round ++))
    ((round ++))
done

# touch purple/$HOSTNAME/tcpdump/$HOSTNAME.pcap
# timeout 500 tcpdump -i eth0 -w purple/$HOSTNAME/tcpdump/$HOSTNAME.pcap
