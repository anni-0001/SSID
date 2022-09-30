# ^^^^^^^^^^^^^^^^^^^^^^^^
# ubuntu Dockerfile
FROM ubuntu

RUN apt update && apt install  openssh-server sudo wireshark net-tools -y
RUN  echo 'root:password' | chpasswd
RUN touch /home/ubuntu/hi.txt |echo "hi"> hi.txt
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test
RUN  echo 'test:test' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

# commands to enter to activate:
# create the containers
    # docker build -t <imagetype> .
    # docker build -t ubuntu .

    # docker run -dit --name <given name> -p <hostport>:<containerport> <image type>
    # docker run -dit --name ssid-dev3 -p 2003:22 ubuntu


# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# alpline Dockerfile 


# RUN \
#   apk update && \
#   apk add openrc --no-cache && \
#   apk add openssh-server && \
#   rc-update add sshd && \
#   rc-status && \
#   touch /run/openrc/softlevel 

# Expose port for ssh
# EXPOSE 22

# Start SSH Service
# CMD ["sh" , "-c", "service sshd restart && sh"]
# RUN mkdir hi