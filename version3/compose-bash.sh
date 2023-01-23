#!/bin/bash

# initalize variables
z=4
start_port=2201
SHARED_VOLUME=/home/amc1100/Documents/research/SSID
SHARED_VOLUME_HOME=/Users/annika/Documents/SSID:/purple/

# Create the docker-compose.yml file
echo "version: '3'" > docker-compose1.yml
echo "services:" >> docker-compose1.yml

# Loop to create z hosts
for ((i=1; i<=z; i++))
do
    echo "  dev$i:" >> docker-compose1.yml
    echo "    container_name: dev$i" >> docker-compose1.yml
    echo "    build:" >> docker-compose1.yml
    echo "      context: ." >> docker-compose1.yml
    echo "      dockerfile: Dockerfile" >> docker-compose1.yml
    echo "    ports:" >> docker-compose1.yml
    # echo '      - "220$1:"' >> docker-compose1.yml
    echo "      - ${start_port}:22" >> docker-compose1.yml
    start_port=$((start_port+1))
    echo "    hostname: dev$i" >> docker-compose1.yml
    echo "    volumes:" >> docker-compose1.yml
    echo "      - $SHARED_VOLUME:/purple/" >> docker-compose1.yml
    if [ $i -gt 1 ]; then
        echo "    depends_on:" >> docker-compose1.yml
        echo "      - dev$((i-1))" >> docker-compose1.yml
        
        echo dev$((i-1))
    fi 
    echo "              " >> docker-compose1.yml

done