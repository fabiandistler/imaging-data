import sqlite3
import csv

conn = sqlite3.connect('imaging-data.db')
cur = conn.cursor()

with open("/home/fabian/git/imaging-data/data/combined_data.csv", 'r') as f:
    reader = csv.reader(f)
    next(reader)  # Skip the header row if present
    for row in reader:  # Iterate over the first two rows

        print(row)  # Print the row for debugging purposes
        cur.execute('INSERT INTO frame_level_data (mouse_id, session_type, frame_number,running_speed,stimulus_type,component_id,onset_value) VALUES (?, ?, ?, ?, ?, ?, ?)', row)

    conn.commit()

conn.close()
