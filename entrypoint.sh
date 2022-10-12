#!/bin/bash

touch purple/$HOSTNAME/tcpdump/$HOSTNAME.pcap
tcpump -i eth0 -w $HOSTNAME.pcap
