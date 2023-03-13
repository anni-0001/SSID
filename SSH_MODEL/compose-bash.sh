#!/bin/bash

# initalize variables
# z=$(($1+2))
z=$(($1))
# z=$1
# echo $z
experiment_num=$2
scan_time=$3
start_ip=2

# if [ $4 ]; then
#     SHARED_VOLUME=$4
# else
#     SHARED_VOLUME=/home/amc1100/Documents/research/SSID
# fi

START_PORT=220$z
# echo $START_PORT
SHARED_VOLUME_HOME=$SHARED_VOLUME_HOME:/purple/
OUT=docker-compose.yml

# Create the docker-compose.yml file
echo "version: '3'" > $OUT
echo "services:" >> $OUT

write_entry () {
    echo "  dev$1:" >> $OUT
    echo "    container_name: dev$1" >> $OUT
    echo "    build:" >> $OUT
    echo "      context: ." >> $OUT
    echo "      dockerfile: Dockerfile" >> $OUT
    echo "    ports:" >> $OUT
    # echo '      - "220$1:"' >> docker-compose1.yml
    echo "      - \"${START_PORT}:22\"" >> $OUT
    START_PORT=$(($START_PORT-1))
    echo "    hostname: dev$1" >> $OUT
    echo "    volumes:" >> $OUT
    echo "      - \${SHARED_VOLUME_HOME}:/home/ubuntu/purple/" >> $OUT
    echo "    command: /opt/docker-internal.sh \$${SCAN_TIME}" >> $OUT
    if [ $2 ]; then
        echo "    depends_on:" >> $OUT
        echo "      - dev$2" >> $OUT
    fi 
    echo "    stdin_open: true" >> $OUT
    echo "    tty: true" >> $OUT
    echo "              " >> $OUT

    echo "    privileged: true" >> $OUT
    echo "    networks:" >> $OUT
    echo "      SSID1:" >> $OUT
    echo "        ipv4_address: 10.10.5.$start_ip" >>$OUT
    # echo "    networks: " >> $OUT
    # echo "      SSID1:" >> $OUT
    # echo "        ipv4_address: 10.10.5.$start_ip" >> $OUT
    # start_ip=$((start_ip +1))


}

# Write target (victim) host w/ no dependency
write_entry $z
# Write Stepping-stone hosts & attacker (all depending on prior host)
for ((i=z-1; i>0; i--))
do
    start_ip=$((start_ip +1))
    j=$(($i+1))
    write_entry $i $j
    
done
# echo "networks:" >> $OUT
# echo "  default:" >> $OUT
# echo "      name: SSID1" >> $OUT
# echo "      external: true" >> $OUT
# echo "        ipam:" >> $OUT

echo "networks:" >> $OUT
echo "  SSID1:" >>$OUT
echo "    driver: bridge" >>$OUT
echo "    ipam:" >> $OUT
echo "      config:" >> $OUT
echo "        - subnet: 10.10.5.0/24" >> $OUT
