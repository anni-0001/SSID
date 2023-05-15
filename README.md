# SSID-Docker

This project is an improvement of previous works on Stepping Stone Intrusion Detection (SSID). Automation is the focus to mantain flexibilty as well as seemless experiment integrity for each round of samples. Using Docker, this project simulates network activity as if there were stepping stone attacks occuring, all while collecting network traffic samples. 

This project can create an unlimited size data set on SSID to be using for machine learning applications.

# Triggering Structure
(1) docker-external.sh --> 
(2) compose-bash.sh & ssh-config.sh --> 
(3) docker-compose.yml --> 
(4) docker-internal.sh --> 
(5) tmux.sh
--> = triggers script

# Files & Uses
docker-external.sh : 
* takes user input for devices, rounds, and scan time
* Manages experiment loop and docker container management
* sets values in round.txt, dev-num.txt, scan_time.txt and proxy.txt

compose-bash.sh : 
* generates a dynamic docker-compose.yml based on configured options for each experiment

ssh-config.sh
* generates dynamic ssh config file for each docker container for each experiment

docker-internal.sh
* manages the internal commands within docker containers
* sets up scans using tcpdump, first device always attacker container

# Available Models

- SSH Tunnel: SSH_MODEL
    * purely SSH tunnel
- TCP SSH Tunnel: TCP_SSH_MODEL
    * SSH tunnel with TCP chain at random interval between hosts

Future:
    - HTTP Tunnel (netcat/socat)
    - FTP Tunnel


# Documentation

To create network:
    docker network create SSID1

To build experiments run: SSH_MODEL/docker-external.sh
    - provide scantime, devices, and experiment rounds
    - auto populates docker-compose, docker-internal.sh, ssh config, and tmux.sh


# General Commands

To access any container within instance:
    docker exec -it <container ID> bash

To rebuild all instances with updated Dockerfile: 
    docker-compose up --build

