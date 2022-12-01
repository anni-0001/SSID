#!/bin/bash 
dir_num=25
experiment_length=20
round=0
SCAN_TIME = 100
# configure the files in this script - keep docker as generic as possible

<< comment
- create directories, 
- loops of number of samples : docker-compose up
        - after $experiment_length, quit container

comment

# - sets experiment perameters (rounds, time, type)


# 
while [ $round -le 25 ]
do 

    mkdir -p tcpdump/$round 2>&1 | grep -v "mkdir:"
    timeout SCAN_TIME docker-compose up --build

    ((round ++))
done &

round=0

while [ $round -le $dir_num ]
do

        while true
        do
                echo "starting docker containers"
                docker-compose up

                # wait_period=$(($wait_period))
                sleep $experiment_length

                docker stop
        done
        ((round ++))
done



# port=22; ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -t -p $port root@dev4  'bash -s'<<EOF 
#         echo "sleeping for 5s"
#         sleep 5
#         pwd
#         echo "sleeping for 5s"

#         sleep 5
#         env
#         echo "sleeping for 5s"
#         sleep 5
#         seq 10
# EOF      
# echo hi

# echo '$HOSTNAME'

# name=dev
# num=1
# hostnumber=${HOSTNAME:3}
# num2=$((num+1))
# echo $num2
# echo $name$num

