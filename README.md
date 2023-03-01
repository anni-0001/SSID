# SSID-Docker

This project is an improvement of previous works on Stepping Stone Intrusion Detection (SSID). Automation is the key here, with a streamlined approach relying less on python scripting and more on the powerful Docker API to spin up infrastructure for a range of experiments seamlessly.

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

