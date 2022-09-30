FROM ubuntu

FROM ubuntu
RUN apt update && apt install  openssh-server sudo wireshark net-tools -y
RUN  echo 'root:password' | chpasswd
RUN touch /home/ubuntu/hi.txt |echo "hi"> hi.txt
# RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test
RUN  echo 'test:test' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]


# RUN apt update && apt install  openssh-server sudo -y
# RUN  echo 'root:password' | chpasswd
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
# RUN service ssh start
# EXPOSE 22
# CMD ["/usr/sbin/sshd","-D"]


# FROM ubuntu
# # RUN apk add --update --no-cache openssh bash
# # # RUN echo 'Accessing Docker file'
# # CMD ["echo", "HI there"]
# # # RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
# # # RUN adduser -h /home/anni -s /bin/sh -D anni
# # # RUN echo -n 'anni:abc' | chpasswd
# # RUN mkdir /hi
# # # RUN echo "HIII" > hi.txt


# RUN apt-get update && \
# apt-get install -y netcat ssh iputils-ping && \
# mkdir /var/run/sshd && \
# chmod 0755 /var/run/sshd && \
# useradd -p $(openssl passwd -1 u2password) --create-home --shell /bin/bash --groups sudo u2
# # CMD ["echo", "hello there"]

# EXPOSE 2001:22
# CMD ["/usr/sbin/sshd", “-D”]


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