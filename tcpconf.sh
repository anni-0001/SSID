#!/bin/bash

<< comment

This script is loaded by Dockerfile-ubuntu for experiment management

- creates required file system
- sets experiment perameters (rounds, time, type)
- starts tcpdump for packet capture

comment

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
    mkdir /purple/$HOSTNAME/tcpdump/$round 2>&1 | grep -v "mkdir:"


    ((round ++))
done &

<< comment
this loop could add all ips into known hosts 
comment

declare -a arrVar
arrVar=()
port=22
user=test


<< comment
    ssh-keygen 
    then copy into nextDev private key file?

    need to automate ssh so that it does not ask fora password & already a known host
    ssh is working, but not in the way we want it to - is there a way to trigger a script on local machine when docker runs?
    maybe try on a smaller scale 

    try:
    - mounting shared volume with the ssh keys
        ** seperate key files --> read those into authorized hosts
    - try expects bash script & then add interactive @bottom to spawn an interactive shell
    - try python perimeko library for automating some of the docker env types



    ssh configs using keys ... in progress:

    ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y
    cat ~/.ssh/id_rsa.pub | ssh root@$nextDev "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
    cat ~/.ssh/id_rsa.pub | ssh root@$nextDev 'cat >> ~/.ssh/authorized_keys'
    chmod 600 ~/.ssh/authorized_keys
    service ssh restart


    # mkdir ~/.ssh/known_hosts
    # ssh-keyscan -H $nextDev >> ~/.ssh/known_hosts
    # echo "~/.ssh/known_hosts"


comment


<< comment
runs tcpdump x times for                                                                                                                       
x number of  experiments
generates x folders
comment

# starts a round dir_num of times - initiates tcp dump for 'SCAN_TIME' number of seconds
while [ $round -le $dir_num ]
do 

    echo "Round: ${round}"

    timeout $SCAN_TIME tcpdump -i eth0 -w /purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap --print
    # timeout $SCANTIME 
    # if host is dev1 - run ssh tunnel through other hosts
    if [ $hostnumber == 1 ]; then
        # ssh -A -t -p $port root@172.18.0.3 ssh -A -t -p $port root@172.18.0.4 ssh -A -p $port root@172.18.0.5
        ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4
        
    fi
    ((round ++))
done 

<<comment
    interactive tunnel: not recreating tunnel for each commmand
        - expects bash 
    tmux session in final dev: have open bash session for commands
        - have script that pipes commands

comment



# random number generator for random command generation
# if hostname == dev1
#   pick random number and associate number with a specific command
#   send command to dev4 IP via ssh 
            # ssh ips are +1 from hostname, ssh into ip (hostname +2)
#       (PARSE IP FILE OR maybe touch a file)

# if (())



