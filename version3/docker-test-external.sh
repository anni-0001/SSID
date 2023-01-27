#!/bin/bash

SCAN_TIME=300
sudo timeout $SCAN_TIME docker-compose up --build
