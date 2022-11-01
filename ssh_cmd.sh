#!/bin/bash

# docker ps comand to grab contianer id and session
docker ps -a --format "{{.ID}}\t\"{{.Status}}\"\t{{.Names}}" | awk -F$"\t" '{printf "%s|%s|%s\n", $1, $2, $3}

