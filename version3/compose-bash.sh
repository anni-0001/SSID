#!/bin/bash

# initalize variables
# z=$(($1+2))
z=$(($1))
echo $z
experiment_num=$2
scan_time=$3

# if [ $4 ]; then
#     SHARED_VOLUME=$4
# else
#     SHARED_VOLUME=/home/amc1100/Documents/research/SSID
# fi

START_PORT=220$z
echo $START_PORT
SHARED_VOLUME_HOME=$SHARED_VOLUME:/purple/
OUT=docker-compose1.yml

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
    echo "      - \${SHARED_VOLUME}:/purple/" >> $OUT
    echo "    command: /opt/docker-internal.sh \${SCAN_TIME}" >> $OUT
    if [ $2 ]; then
        echo "    depends_on:" >> $OUT
        echo "      - dev$2" >> $OUT
    fi 
    echo "    stdin_open: true" >> $OUT
    echo "    tty: true" >> $OUT
    echo "              " >> $OUT
}

# Write target (victim) host w/ no dependency
write_entry $z
# Write Stepping-stone hosts & attacker (all depending on prior host)
for ((i=z-1; i>0; i--))
do
    j=$(($i+1))
    write_entry $i $j
done
echo "networks:" >> $OUT
echo "  default:" >> $OUT
echo "      name: SSID1" >> $OUT
echo "      external: true" >> $OUT