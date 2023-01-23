#!/bin/bash 

service ssh start

round=1
dir_num=25
while [ $round -le $dir_num ]
do 
    echo round: $round
    mkdir /purple/tcpdump/$round 
    # mkdir -p /purple/tcpdump/$round 2>&1 | grep -v "mkdir:"
    # timeout SCAN_TIME docker-compose up --build

    # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap


    ((round ++))
done &

round=1
# working alias
if [ "$HOSTNAME" == "dev4" ]; then

    # echo 'alias hi="echo hello"' >> ~/.bashrc
    chmod 700 /purple/version3/sleep-timer.sh
    # alias sleep-timer='bash '
    alias sleeper="bash /purple/version3/sleep-timer.sh"

    fi &

if [ "$HOSTNAME" == "dev1" ]; then
#         export round
    
        echo 'alias round="($round)"'

#         ./usr/local/sbin/tmux.sh
        # tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap
#         # bash tmux.sh

fi &

if [ "$HOSTNAME" == "dev2" ] ||[ "$HOSTNAME" == "dev3" ] || [ "$HOSTNAME" == "dev4" ]; then
    tcpdump -i eth0 -w /purple/tcpdump/$round/$HOSTNAME.pcap


fi &

sleep 10000

echo "all ($dir_num) directories made!"

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
