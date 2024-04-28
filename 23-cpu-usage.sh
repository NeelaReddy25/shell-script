#!/bin/bash

# Threshold for CPU usage
THRESHOLD=80

# Function to send an alert
send_alert() {
    process_id=$1
    process_cpu=$2
    echo "Process with PID $process_id is using $process_cpu% CPU, which is above the threshold of $THRESHOLD%" | mail -s "High CPU Usage Alert" neelareddy.i10204@gmail.com
}

# Get the top 5 CPU-consuming processes
top_processes=$(ps -eo pid,%cpu --sort=-%cpu | head -n 6)

# Skip the first line (headers)
top_processes=$(echo "$top_processes" | sed 1d)

# Check each process and send an alert if needed
while read -r pid cpu
do
    cpu=${cpu%.*} # Remove decimal part
    if [ "$cpu" -gt "$THRESHOLD" ]; then
        send_alert "$pid" "$cpu"
    fi
done <<< "$top_processes"