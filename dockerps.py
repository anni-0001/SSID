import os
import subprocess
# from subprocess import popen, PIPE

# ps = subprocess.call("docker", "ps")
ps = subprocess.Popen(["docker", "ps"], stdout=subprocess.PIPE)


print(ps)
for line in ps:
    print(line)
