#!/bin/bash

cat ~/.bashrc > myalias.txt
source myalias.txt 
shopt -s expand_aliases

# attacker_send=30
victim_send=45
p_sleep=$(( $RANDOM % 15 + 1 ))
n_rounds=$(( $RANDOM % 10 + 1 ))
cmdround=10
s=30
s_attacker=""
r_victim=20

# creating arbitrary attacker send string; 19 is extra bytes from spaces & ;
for ((z=1; z<=s-19; z ++)); do
    s_attacker+="1"
done

for ((x=1; x<=cmdround; x++));do
    n_rounds=$(( $RANDOM % 10 + 1 ))

    # echo "attacker side command: $x"
    # tmux send-keys -t mySession.1 "n=$n_round; a"
    n=$n_rounds; a; $s_attacker 2>/dev/null
    sleep $p_sleep
done

# for ((x=1; x <=n_rounds; x ++)); do
#     p_sleep=$(( $RANDOM % 15 + 1 ))
#     s_attacker=


# done







# # cat ~/.bashrc > myalias.txt
# source myalias.txt 
# shopt -s expand_aliases

# n=10; a 
# # n = n, number of “commands”/bursts of traffic (e.g., number of times to loop)
# # attacker_send = s, number of characters to send by the attacker (for the current command)
# # victim_send = r, number of characters to send by the victim machine (for the current command)
# # sleep_cmd = p, time to sleep before starting the next command in the loop

# # ** placeholder values for random sample from Clares data **
# n=10
# attacker_send=30
# victim_send=45
# sleep_cmd=5

# # function a(){ for ((c=1; c<=n-1; c ++)); do echo -n '1'; done; echo hi}

# n=10
# for ((x=1; x<=n-1; x++));do
#     # echo "attacker side command"
#     n=10; a
#     # tmux send-keys -t mySession.1 "n=10; a"
# done



