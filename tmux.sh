#!/bin/bash

# tmux new-session -s ses-0 -n my-screen-name -d

# tmux split-window -v
# tmux attach-session -t 0
# tmux send-keys -t 0 "htop" C-m
# # tmux send-keys -t 1 "timeout 10 tcpdump -i en0" C-m


# tmux send-keys -t 1 "sleep 10" C-m
# # tmux send-keys -t ses-0 "htop" C-m

# tmux attach-session -t ses-0

# tmux send-keys -t 1 "echo hi" C-m
# tmux attach-session -t ses-0


tmux new -d -s mySession
sleep 2
tmux split-window -v
tmux send-keys -t mySession.1 "timeout 25 tcpdump -i en0 -w tcpdump.sh"
# tmux send-keys -t mySession.1 "timeout 20 tcpdump -i eth0 -w /purple/$HOSTNAME/tcpdump/$round/$HOSTNAME.pcap"
# tmux send-keys -t mySession.0 "cd .." ENTER
date
tmux send-keys -t mySession.0 "date"
echo "sent date; ${date}"
sleep 5
tmux send-keys -t mySession.0 "sleep 10;date" C-m
# tmux a -t mySession
# tmux detach-client -t mySession.0
# tmux detach
date
# tmux d -t
# can we flush send keys?

sleep 2
tmux send-keys -t mySession.0 "echo hi ; date" C-m
# tmux a -t mySession
# tmux a -t mySession
sleep 10
echo "going to sleep for 10 seconds"; date
tmux send-keys -t mySession.0 "sleep 10;date" C-m
tmux send-keys -t mySession.0 "echo 'done sleep for 10 seconds'; date" C-m
echo "done sleep for 10 seconds"; date

# sleep 5
# tmux send-keys -t mySession.0 "echo bye; date" C-m
# sleep 2
# tmux send-keys -t mySession.0 "sleep 10;date" C-m

# sleep 2
# tmux send-keys -t mySession.1 "echo window2; date" C-m
# sleep 5
# tmux send-keys -t mySession.0 "echo bye; date" C-m
# sleep 5
tmux a -t mySession

