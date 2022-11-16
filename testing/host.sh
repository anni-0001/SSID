#!/bin/bash 


echo '$HOSTNAME'

name=dev
num=1
hostnumber=${HOSTNAME:3}
num2=$((num+1))
echo $num2
echo $name$num

