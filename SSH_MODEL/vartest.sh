#!/bin/bash

output=($(python3 p_script.py))

# Assign the array elements to individual Bash variables
var1="${output[0]}"
var2="${output[1]}"
var3="${output[2]}"

# Use the Bash variables in other commands
echo "Var1: $var1"
echo "Var2: $var2"
echo "Var3: $var3"