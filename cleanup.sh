#!/bin/bash

# rm -rf 

i=1
while [ $i -le 25 ]
do
    echo "removing folder ${i}"
    rm -rf tcpdump/$i
    
    ((i++))
done