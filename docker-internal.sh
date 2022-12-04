#!/bin/bash

hostnumber=${HOSTNAME:3}
service ssh start
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# replacement for tcpconf.sh - internal docker commands

<<comment
    - initalizes ssh 
    - initializes tmuxinator panes if dev1
        1. tcpdump 
        2. ssh tunnel
            - generate command sequence
            - feed commands into tunnel

comment
# sleep 1000



if [ $hostnumber -eq 1 ];then
    # mkdir -p /purple/$HOSTNAME/tcpdump/$round 2>&1 | grep -v "mkdir:"

    chmod 700 /purple/$HOSTNAME/tcpdump/tmux.sh
    ./tmux.sh
    # sleep 1000
    # mkdir /root/.config/tmuxinator/
    # chmod 700 /root/.config/tmuxinator/


    echo "new session"
    # tmuxinator new ssid
    # # mv /usr/local/sbin/tmuxinator_ssid.yml ~/.config/tmuxinator/ssid.yml

    # tmuxinator start ssid -p /usr/local/sbin/tmuxinator_ssid.yml

fi

# if[ $hostnumber -eq 2 ]; then


sleep 1000
# done
