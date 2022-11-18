#!/bin/bash

cmdArr=("pwd" "echo" "hostname" "env" "sleep 10")

for str in ${cmdArr[@]}; do
    $str
    sleep 10
done

echo "$(cat /etc/passwd)"
# pwd
# sleep 5
# tty 
# sleep 5
# echo hi
# sleep 5
# pwd
# sleep 5
# env
# hostname
# sleep 5
# cat /etc/passwd
# sleep 10
# echo 'hi'
# sleep 10