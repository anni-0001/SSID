#!/bin/bash 

# service ssh start
# export round 
round=1
dir_num=25


round=1
experiment_num=$(cat /purple/version3/round.txt)
# echo $experiment_num
scan_time=$(cat /purple/version3/scan_time.txt)
# echo $scan_time
# working alias
if [ "$HOSTNAME" == "dev4" ]; then

    # echo 'alias hi="echo hello"' >> ~/.bashrc
    chmod 700 /purple/version3/sleep-timer.sh
    # alias sleep-timer='bash '
    alias sleeper="bash /purple/version3/sleep-timer.sh"

    fi &


# tcpdump -i eth0 -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap




if [ "$HOSTNAME" == "dev1" ]; then
sleep 5

# tmux new -d -s mySession

# # Split the window horizontally into two panes
# tmux split-window -h
# #         export round
# tmux send-keys -t mySession.1 "[] tcpdump -i eth0 -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap" Enter

# tmux send-keys -t mySession.0 "ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4" Enter

    
    
        # echo 'alias round="($round)"'

#         ./usr/local/sbin/tmux.sh
        # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap
#         # bash tmux.sh
        ./opt/tmux.sh
        # tcpdump -i eth0 -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap

fi 

# if [ "$HOSTNAME" == "dev2" ] ||[ "$HOSTNAME" == "dev3" ] || [ "$HOSTNAME" == "dev4" ]; then
#     # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap
#     tcpdump -i eth0 -w /purple/tcpdump/$experiment_num/$HOSTNAME.pcap


# fi

# sleep 10000

# echo "all ($dir_num) directories made!"

# chmod 700 /usr/local/sbin/tmux.sh
# dir_num =25
# experiment=1
# while [ $experiment -le $dir_num ]
# do 
#     if [ "$HOSTNAME" == "dev1" ]; then
#         export round
        

#         ./usr/local/sbin/tmux.sh
#         # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap
#         # bash tmux.sh

#     fi &
#     sleep 15
 

#     # ./cleanup.sh
#     docker ps -qa|xargs docker rm -f

#     ((experiment ++))

# done
