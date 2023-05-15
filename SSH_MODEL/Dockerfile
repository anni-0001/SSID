# ubuntu Dockerfile
FROM ubuntu

RUN apt update && apt install openssh-server sudo iproute2 python3 acct coreutils sshpass tcpdump vim tmux tmuxinator netcat pip docker net-tools -y
RUN pip install paramiko scapy

# ---------user configuration
RUN echo 'root:password' | chpasswd
RUN passwd -d root

COPY requirements.txt .
RUN pip install -r requirements.txt

# --------ssh session configuration
EXPOSE 22
RUN service ssh start
RUN mkdir ~/.ssh
RUN chmod 700 ~/.ssh
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config
RUN echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
RUN touch ~/.ssh/authorized_keys
COPY config /root/.ssh/
RUN chmod 600 ~/.ssh/config
RUN service ssh restart

# -------tmux session configuration
# SHELL ["/bin/bash", "-c"]
# COPY tmux.sh /usr/local/sbin/
# RUN chmod 700 /usr/local/sbin/tmux.sh




# --------docker-external.sh 
COPY tmux.sh /opt/
#RUN chmod 700 /opt/tmux.sh
RUN chmod +x /opt/tmux.sh
# COPY cmd.txt /opt/
COPY docker-internal.sh /opt/
RUN chmod +x /opt/docker-internal.sh
#CMD ["/opt/docker-internal.sh"]
# COPY /tcpdump/ /tmp/tcpdump
# RUN chmod -R 777 /purple/


# --------psacct configurations
RUN service acct restart

# commands to build containers:
# sudo docker-compose up --build