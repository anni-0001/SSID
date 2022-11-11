#!/bin/bash

<< comment

This is a simple script for cleaning up after experiemts

Helpful before a push to github to reduce unneeded data

comment


i=1
while [ $i -le 25 ]
do
    echo "removing folder ${i}"
    rm -rf tcpdump/$i
    
    ((i++))
done