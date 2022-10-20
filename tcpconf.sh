#!/bin/bash


# setting experiemnt variables
dir_num=25
round=1
SCAN_TIME=60
hostNUM=4

# starting ssh
service ssh start

# grab ip address & adding to fiel
echo "${HOSTNAME} : $(hostname -i)" >> purple/$HOSTNAME/tcpdump/devaddr.txt
# organizing IP addresses & indexes
ipaddr=$(hostname -i)
lastoctet=${ipaddr:9}
hostnumber=${HOSTNAME:3}
nextDev=${ipaddr:0:9}$((hostnumber+1))



<< comment
creates x number of 
directories for experiemnts
comment

while [ $round -le $dir_num ]
do 
    mkdir purple/$HOSTNAME/tcpdump/$round

    touch a_file.txt

    ((round ++))
done &

<< comment
runs tcpdump y times for 
x number of directoreis for experiments
comment

while [ $round -le $dir_num ]
do 

    ssh $hostname

    timeout $SCAN_TIME tcpdump -i eth0 -w purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap

    ((round ++))
done


# random number generator for random command generation
# if hostname == dev1
#   pick random number and associate number with a specific command
#   send command to dev4 IP via ssh 
            # ssh ips are +1 from hostname, ssh into ip (hostname +2)
#       (PARSE IP FILE OR maybe touch a file)




# working currently: @ 8:45 pm


# ipaddr=$(hostname -i)
# lastoctet=${ipaddr:9}
# hostnumber=${HOSTNAME:3}
# nextDev=${ipaddr:0:9}$((hostnumber+2))
# h=1

while [ $h -le $hostNUM ]
do
	# echo $nextDev
	# echo $HOSTNAME
	ssh root@$nextDev
	((hostnumber++))
	((h++))
done





# grabs the IP of the next host

# echo "$((host+1))"

# combines first part of IP & next host in last octet


# echo $nextDev
~             

# # grabs the last octet of current host IP:
# ipaddr=$(hostname -i)
# lastoctet=${ipaddr:9}

# # grabs the IP of the next host
# nexthost=${HOSTNAME:3}
# echo "$((host+1))"

# # combines
# nextDev=${ipaddr:0:9}$nexthost


# # last=4
# # ipmore=${ipaddr:0:9}

# # echo $nextDev
# # echo $ipmore
# # echo $ip

