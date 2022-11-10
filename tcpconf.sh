#!/bin/bash


# setting experiemnt variables
dir_num=25 # can be set to how ever many iterations of experiment
round=1 #a simple counter for rounds interation
SCAN_TIME=200 # modify for length of experiment
hostNUM=4 # modify for # of hosts to run experiement on


# starting ssh
service ssh start

# run password into file
echo 'test' > password.txt 
chmod 600 password.txt

# grab ip address & adding to fiel
echo "${HOSTNAME}:$(hostname -i)" >> purple/$HOSTNAME/tcpdump/devaddr.txt
# organizing IP addresses & indexes
ipaddr=$(hostname -i)
lastoctet=${ipaddr:9}
echo "$lastoctet"
hostnumber=${HOSTNAME:3}
nextDev=${ipaddr:0:9}$((hostnumber+2))

# sleep 10000


# LOOK HERE

# make new script external view for SSH and iterate the experiments from outside docker containers
# cut off this scrpt just setting tcp listener - no while loops
# ssh extrnerally & loop exterally for packet capture (outside bash scrip from personal command line)


<< comment
creates x number of 
directories for experiemnts
comment

while [ $round -le $dir_num ]
do 
    # mkdir purple/tester
    mkdir /purple/$HOSTNAME/tcpdump/$round 2>&1 | grep -v "mkdir:"
    # touch /purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap

    # touch a_file.txt

    ((round ++))
done &
# sleep 100

<< comment
this loop could add all ips into known hosts 
comment

declare -a arrVar
arrVar=()
port=22
user=test

# filename="/tcpdump/devaddr.txt"
# IFS=":"
# while read -r line; do

#     dev=$(echo "$line" | cut -d ":" -f2)

#     arrVar+=("$dev")

# done < "tcpdump/ips.txt" 
# echo "${arrVar[@]}"

# for i in 1 2 3 4
# do
#     # echo "~/.ssh/is_rsa.pub"
#     echo ssh-copy-id dev
# name=dev
# num=
# ssh-keygen
# touch ~/.ssh/authorized_keys
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y
# ssh-copy-id -i ~/.ssh/id_rsa.pub -p 22 root@$nextDev

# cat ~/.ssh/id_rsa.pub | ssh root@$nextDev "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
cat ~/.ssh/id_rsa.pub | ssh root@$nextDev 'cat >> ~/.ssh/authorized_keys'
chmod 600 ~/.ssh/authorized_keys
service ssh restart
# ssh-keyscan $nextDev

<< comment
ssh-keygen 
then copy into nextDev private key file?

need to automate ssh so that it does not ask fora password & already a known host
    ssh is working, but not in the way we want it to - is there a way to trigger a script on local machine when docker runs?
    maybe try on a smaller scale 

try:
- mounting shared volume with the ssh keys
- try expects bash script & then add interactive @bottom to spawn an interactive shell
- try python perimeko library for automating some of teh docker env types
comment

<< comment
runs tcpdump y times for                                                                                                                       
x number of directoreis for experiments
comment

# mkdir ~/.ssh/known_hosts
# ssh-keyscan -H $nextDev >> ~/.ssh/known_hosts
# echo "~/.ssh/known_hosts"




while [ $round -le $dir_num ]
do 

    # sshpass -f password.txt /usr/bin/ssh -p 22 test@$nextDev
    echo "Round: ${round}"
    echo "hostnumber ${hostnumber}" 

    timeout $SCAN_TIME tcpdump -i eth0 -w /purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap 

# needs to be sudo - decide if we even want this funcitonality
    # cat ~/.ssh/id_rsa.pub | ssh $nextDev 'cat >> /.ssh/authorized_keys'

    if [ $hostnumber == 1 ]; then
        # ssh -A -t -p $port $user@${arrVar[0]} ssh -A -t -p $port $user@${arrVar[1]} ssh -A -t -p $port $user@${arrVar[2]} ssh -A -t -p $port $user@${arrVar[3]}

        ssh -A -t -p $port $user@172.18.0.2 ssh -A -t -p $port $user@172.18.0.3 ssh -A -t -p $port $user@172.18.0.4 ssh -A -p $port $user@172.18.0.5 

        
        # ssh -J test@${ipaddr:0:9}$((hostnumber+2)), test@${ipaddr:0:9}$((hostnumber+3)), test@${ipaddr:0:9}$((hostnumber+4))
        # echo "hi I was here" >> sshTest.txt


    fi
    ((round ++))
done 

# ssh -A -t -p 22 -i ~/.ssh/id_rsa -oStrictHostKeyChecking=no root@172.18.0.3 ssh -A -t -p 22 -i ~/.ssh/id_rsa -oStrictHostKeyChecking=no root@172.18.0.4 ssh -A -p 22 -i ~/.ssh/id_rsa -oStrictHostKeyChecking=no root@172.18.0.5

works
# ssh -A -t -p 22 -oStrictHostKeyChecking=no root@172.18.0.3 ssh -A -t -p 22 -oStrictHostKeyChecking=no root@172.18.0.4 ssh -A -p 22 -oStrictHostKeyChecking=no root@172.18.0.5
# ssh -A -t -p 22 root@172.18.0.2 ssh -A -t -p 22 root@172.18.0.3 ssh -A -t -p 22 root@172.18.0.4 ssh -A -p 22 root@172.18.0.5
ssh -A -t -p 22 root@dev1 ssh -A -t -p 22 root@dev2 ssh -A -t -p 22 root@dev3 ssh -A -p 22 root@dev4



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




