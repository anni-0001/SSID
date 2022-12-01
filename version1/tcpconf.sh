#!/bin/bash

<< comment

This script is loaded by Dockerfile-ubuntu for internal experiment management

- run tmuxinator session
    - tcpdump collection
    - run tmux commands within session


comment

# setting experiemnt variables
dir_num=25 # can be set to how ever many iterations of experiment
round=1 #a simple counter for rounds interation
SCAN_TIME=30 # modify for length of experiment
hostNUM=4 # modify for # of hosts to run experiement on


# starting ssh
service ssh start


# grab ip address & adding to fiel
# echo "${HOSTNAME}:$(hostname -i)" >> /purple/$HOSTNAME/tcpdump/devaddr.txt
# /Users/annika/Documents/SSID/tcpdump/devaddr.txt
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
    mkdir -p /purple/$HOSTNAME/tcpdump/$round 2>&1 | grep -v "mkdir:"
    timeout SCAN_TIME docker-compose up --build



    ((round ++))
done &


declare -a arrVar
arrVar=()
port=22
user=test


<< comment
    try:
    - mounting shared volume with the ssh keys
        ** seperate key files --> read those into authorized hosts
    - try expects bash script & then add interactive @bottom to spawn an interactive shell
    - try python perimeko library for automating some of the docker env types

comment


<< comment
runs tcpdump x times for                                                                                                                       
x number of  experiments
generates x folders
comment


export EDITOR="vim"
# starts a round dir_num of times - initiates tcp dump for 'SCAN_TIME' number of seconds
# while [ $round -le $dir_num ]
# do 
#     echo "Round: ${round}"

#     if [ $hostnumber == 1 ]; then
#     sudo tmuxinator new ssid
#     sudo tmuxinator start ssid -n $round -p /usr/local/sbin/tmuxinator_ssid.yml
#     # use tmux for send keys to plug arbitrary data into the desired panel
#         # can go char by char (micro timings)


#     ((round ++))
# done 

<<comment

    TMUXINATOR:
        - pane to initate tcp dump
        - pane to run commands
            use send key tmux to send indiivudal inputs to tmux pane
            tmux session in final dev: have open bash session for commands
                - have script that pipes commands

comment


