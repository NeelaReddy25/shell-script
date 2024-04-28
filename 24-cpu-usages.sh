#!/bin/bash

# Define the CPU usage threshold
THRESHOLD=75

# Function to get the top 5 CPU consuming processes and check against the threshold
check_cpu_usage() {
  echo "Top 5 CPU consuming processes:"
  ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
  echo ""

  # Read the output, line by line, skipping the first line (headers)
  ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6 | tail -n +2 | while read -r pid ppid cmd cpu mem ; do
    # Check if CPU usage of the process is greater than the threshold
    cpu_usage=$(echo "$cpu" | awk '{print int($1+0.5)}')
    if (( cpu_usage > THRESHOLD )); then
      echo "Alert: Process with PID $pid ($cmd) is consuming $cpu% CPU, which is above the threshold of $THRESHOLD% | mail -s "High CPU Usage Alert" neelareddy.i10204@gmail.com"
    fi
  done
}

# Call the function
check_cpu_usage


