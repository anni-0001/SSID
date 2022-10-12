import os
import subprocess

ps = subprocess.call("docker", "ps")
print(ps)
