import random
import pickle
import csv
import subprocess
# import scapy

# Load the pkl file
with open('data/bursts_total.pkl', 'rb') as a:
    bursts = pickle.load(a)
# Sample a random data point
burst_total = random.choice(bursts)
print(burst_total)

with open('data/bytes_received.pkl', 'rb') as b:
    recieved=pickle.load(b)
bytes_recieved=random.choice(recieved)
print(bytes_recieved)

with open('data/bytes_sent.pkl', 'rb') as c:
    sent=pickle.load(c)
bytes_sent=random.choice(sent)
print(bytes_sent)

with open('data/time_between_bursts.csv', 'r') as d:
    reader=csv.reader(d)
    rows = [row for row in reader]
    random_row = random.choice(rows)
    time_between_bursts=random_row[0]
    # random_row.strip()
print(time_between_bursts)


# for i in range(burst_total):





# with open('/Users/annika/Documents/SSID/SSH_MODEL/data/time_between_bursts.pkl', 'rb') as e:
#     bursts=pickle.load(e)
# time_between_bursts=random.choice(bursts)
# print(bytes_sent)



