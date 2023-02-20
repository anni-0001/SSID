#!/bin/bash

# generates random strings of x length in base64 
    # also hex option
    # openssl rand -base64 x
# openssl rand -base64 32


# shuf


# x = 5
round=0
while [ "$round" -le 5 ]
do 
    cmd=$(shuf -n 1 cmd.txt)
    printf "$cmd \n"
    $cmd
    sleep 2

    ((round ++))
done 