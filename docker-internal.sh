#!/bin/bash

hostnumber=${HOSTNAME:3}

# replacement for tcpconf.sh - internal docker commands

<<comment
    - initializes tmuxinator panes if dev1
        1. tcpdump 
        2. ssh tunnel
            - generate command sequence
            - feed commands into tunnel

comment
# sleep 1000
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8


if [ $hostnumber -eq 1 ];then
    # sleep 1000
    # mkdir /root/.config/tmuxinator/
    chmod 700 /root/.config/tmuxinator/


    echo "new session"
    # cp -f /root/.config/tmuxinator/ssid.yml /usr/local/sbin/tmuxinator_ssid.yml
    tmuxinator new ssid
    # mv /usr/local/sbin/tmuxinator_ssid.yml ~/.config/tmuxinator/ssid.yml

    tmuxinator start ssid -p /usr/local/sbin/tmuxinator_ssid.yml

fi

sleep 100
# done
