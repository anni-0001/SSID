#!/bin/bash

# builds docker containers & detaches
# docker-compose up --build

sleep 10
# builds ssh tunnel
ssh -A -t -p 22 root@dev1 ssh -A -t -p 22 root@dev2 ssh -A -t -p 22 root@dev3 ssh -A -p 22 root@dev4 "
    ls; date
    pwd; date
"

