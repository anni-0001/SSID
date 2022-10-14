#!/bin/bash

round = 1 
while $round <= 25
do 
    mkdir $round
    cd $round
    touch a-file.txt
    cd ..
    # round ++
done
