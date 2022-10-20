#!/bin/bash


# setting experiemnt variables
dir_num=25 # can be set to how ever many iterations of experiment
round=1 #a simple counter for rounds interation
SCAN_TIME=60 # modify for length of experiment
hostNUM=4 # modify for # of hosts to run experiement on

# starting ssh
service ssh start

# run password into file
echo 'test' > password.txt 
chmod 600 password.txt

# grab ip address & adding to fiel
echo "${HOSTNAME} : $(hostname -i)" >> purple/$HOSTNAME/tcpdump/devaddr.txt
# organizing IP addresses & indexes
ipaddr=$(hostname -i)
lastoctet=${ipaddr:9}
hostnumber=${HOSTNAME:3}
nextDev=${ipaddr:0:9}$((hostnumber+2))



<< comment
creates x number of 
directories for experiemnts
comment

while [ $round -le $dir_num ]
do 
    mkdir purple/tester
    # mkdir purple/$HOSTNAME/tcpdump/$round
    # touch /purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap

    # touch a_file.txt

    ((round ++))
done &

<< comment
runs tcpdump y times for 
x number of directoreis for experiments
comment

while [ $round -le $dir_num ]
do 

    # sshpass -f password.txt /usr/bin/ssh -p 22 test@$nextDev
    echo "Round: ${round}" 

    timeout $SCAN_TIME tcpdump -i eth0 -w purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap 

    if [ $hostnumber == 1 ]; then
        
        ssh -J test@${ipaddr:0:9}$((hostnumber+2)), test@${ipaddr:0:9}$((hostnumber+3)), test@${ipaddr:0:9}$((hostnumber+4))
        echo "hi I was here" >> sshTest.txt


    fi
    ((round ++))
done 





# random number generator for random command generation
# if hostname == dev1
#   pick random number and associate number with a specific command
#   send command to dev4 IP via ssh 
            # ssh ips are +1 from hostname, ssh into ip (hostname +2)
#       (PARSE IP FILE OR maybe touch a file)

# if (())


# working currently: @ 8:45 pm



# h=1

# while [ $h -le $hostNUM ]
# do
# 	# echo $nextDev
# 	# echo $HOSTNAME
#     sshpass -f password.txt /usr/bin/ssh -p 22 test@$nextDev
# 	# sshpass root@$nextDev
# 	((hostnumber++))
# 	((h++))
# done




