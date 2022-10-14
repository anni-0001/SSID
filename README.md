# SSID-Docker

This project is an improvement of previous works on Stepping Stone Intrusion Detection. Automation is the key here, with a streamlined approach relying less on python scripting and more on the powerful Docker API to spin up infrastructure seamlessly.


# Documentation
To spin up instances:
    docker-compose up -d

To stop all instances:
    docker-compose stop

To access any container within instance:
    docker exec -it <container ID> bash
    


To add containers, simply modify the docker-compose.yaml 

To rebuild all instances with updated Dockerfile: 
    docker-compose up --build

