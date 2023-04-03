import random
import pickle
import csv
import subprocess
import pickle as pkl
import tarfile
# import scapy.all
# RT_DIR="/home/ubuntu"
# DATA_DIR="/home/ubuntu/purple/data/"
DATA_DIR="data/"


t = tarfile.open('data/time_between_bursts.pkl.tar.gz', 'r:gz')
t.extractall()
model = pkl.load(open("time_between_bursts.pkl", 'rb'))
