#!/bin/bash

# setting experiemnt variables
dir_num=25
round=1
SCAN_TIME=60
hostNUM=4

# grab ip address & adding to fiel
echo "${HOSTNAME} : $(hostname -i)" >> purple/$HOSTNAME/tcpdump/devaddr.txt
# organizing IP addresses & indexes
ipaddr=$(hostname -i)
lastoctet=${ipaddr:9}
hostnumber=${HOSTNAME:3}
nextDev=${ipaddr:0:9}$((hostnumber+2))

if [ $hostNUM == $hostnumber ]; then
    echo $(date) >> purple/$HOSTNAME/tcpdump/done.txt
    echo "Experiment is concluded... maximum hosts ${hostNUM} reached" >> purple/$HOSTNAME/tcpdump/done4.txt

    # break
elif [ $hostnumber == 1 ]; then
    
    ssh -J test@${ipaddr:0:9}$((hostnumber+2)), test@${ipaddr:0:9}$((hostnumber+3)), test@${ipaddr:0:9}$((hostnumber+4))
    echo "hi I was here" >> sshTest.txt


fi


# if (($hostNUM == $hostnumber))
# then
#     echo $(date) >> purple/$HOSTNAME/tcpdump/done.txt
#     echo "Experiment is concluded... maximum hosts ${hostNUM} reached" >> purple/$HOSTNAME/tcpdump/done.txt

#     break

# else
#     ssh test@$nextDev
