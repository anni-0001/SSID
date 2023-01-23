#!/bin/bash

timer=$((1+ $RANDOM % 10))
echo sleep $timer seconds
sleep $timer