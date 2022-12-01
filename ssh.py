#!/usr/bin/python

import paramiko

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
# ssh.connect('port=22; ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4')
# ssh.connect('port=22; ssh -A -t -p $port root@dev2 ssh -A -t -p $port root@dev3 ssh -A -p $port root@dev4')
ssh.connect('ssh -A -t -p 22 root@172.18.0.2')
stdin, stdout, stderr =ssh.exec_command('ls -l')


        #   - sleep 10")