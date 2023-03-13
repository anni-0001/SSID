# SSID-Docker

This project is an improvement of previous works on Stepping Stone Intrusion Detection (SSID). Automation is the focus to mantain flexibilty as well as seemless experiment integrity for each round of samples. Using Docker, this project simulates network activity as if there were stepping stone attacks occuring, all while collecting network traffic samples. 

This project can create an unlimited size data set on SSID to be using for machine learning applications.

# Structure
docker-external.sh --> compose-bash.sh & ssh-config.sh --> docker-compose.yml --> docker-internal.sh --> tmux.sh
--> = triggers script

* 

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

