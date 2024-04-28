#!/bin/bash

# Define the CPU usage threshold
THRESHOLD=80

# Get the top 5 CPU consuming processes
TOP_PROCESSES=$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6)

echo "Top 5 CPU consuming processes:"
echo "$TOP_PROCESSES"

# Check if any process exceeds the threshold
while read -r pid ppid cmd cpu ; do
  if [ $(echo "$cpu > $THRESHOLD" | bc) -ne 0 ]; then
    echo "Alert: Process with PID $pid ($cmd) is consuming $cpu% CPU."
  fi
done <<< "$(echo "$TOP_PROCESSES" | tail -n +5)" # Skip the header row

echo "Process with PID $pid is using $cpu% CPU, which is above the threshold of $THRESHOLD%" | mail -s "High CPU Usage Alert" neelareddy.i10204@gmail.com
