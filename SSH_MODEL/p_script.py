import random
import pickle
import csv
import subprocess
# import scapy.all
RT_DIR="/home/ubuntu"
DATA_DIR="/home/ubuntu/purple/data/"
# DATA_DIR="data/"

# Load the pkl file
with open(f"{DATA_DIR}bursts_total.pkl", 'rb') as a:
    bursts = pickle.load(a)
# Sample a random data point
burst_total = random.choice(bursts)

# burst_total = random.choice(bursts)
print(burst_total)

with open(f"{DATA_DIR}bytes_received.pkl", 'rb') as b:
    recieved=pickle.load(b)
bytes_recieved=random.choice(recieved)
print(bytes_recieved)

with open(f"{DATA_DIR}bytes_sent.pkl", 'rb') as c:
    sent=pickle.load(c)
bytes_sent=random.choice(sent)
print(bytes_sent)

# with open(f"{DATA_DIR}time_between_bursts.csv", 'r') as d:
#     reader=csv.reader(d)
#     rows = [row for row in reader]
#     random_row = random.choice(rows)
#     time_between_bursts=random_row[0]
#     # random_row.strip()
# print(time_between_bursts)

with open(f"{DATA_DIR}time_between_bursts.pkl", 'rb') as e:
    data=pickle.load(e)
bytes_sent=random.choice(data)
# sorted_vals= sorted(data, reverse=False)
print(bytes_sent)
    # rows = [row for row in reader]

# for val in sorted_vals:
#     print(val)

# counter=0
# # for( i=0; i <)
# for val in sorted_vals:
#     if val < 1:
#         counter+=1

# print(counter)

    # random_row = random.choice(reader)
#     # time_between_bursts=random_row[0]
#     # random_row.strip()
# print(random_row)
# for i in range(burst_total):





# with open('/Users/annika/Documents/SSID/SSH_MODEL/data/time_between_bursts.pkl', 'rb') as e:
#     bursts=pickle.load(e)
# time_between_bursts=random.choice(bursts)
# print(bytes_sent)



