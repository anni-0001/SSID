#!/bin/bash 
dir_num=25

# configure the files in this script - keep docker as generic as possible

# for $round in 
while [ $round -le $dir_num ]
do 

    mkdir /purple/$HOSTNAME/tcpdump/$round 2>&1 | grep -v "mkdir:"


    ((round ++))
done &

docker-compose up




docker-compose stop



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

