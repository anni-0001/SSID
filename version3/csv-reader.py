import csv
import random

filename='SSID-data-sample.csv'
with open (filename) as c:
    reader=csv.DictReader(c)
    rows=list(reader)
    # print(rows[0])
    selected_row=random.choice(rows)
    send_low=selected_row['send-low']
    # print(send_low)
    send_high=selected_row['send-high']
    recieve_high=selected_row['recieve-high']
    recieve_low=selected_row['recieve-low']

    print(selected_row)

    random_send=random.randint(int(send_low), int(send_high))
    print(random_send)

    random_recieve=random.randint(int(recieve_low), int(recieve_high))
    print(random_recieve)

    print()