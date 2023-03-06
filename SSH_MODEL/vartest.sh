#!/bin/bash

# Call the Python script and capture the output into a Bash array
output=($(python3 p_script.py))

# Assign the array elements to individual Bash variables
var1="${output[0]}"
var2="${output[1]}"
var3="${output[2]}"
var4="${output[3]}"

# Use the Bash variables in other commands
echo "Var1: $var1"
echo "Var2: $var2"
echo "Var3: $var3"
echo "Var4: $var4"
