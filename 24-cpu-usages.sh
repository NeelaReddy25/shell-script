#!/bin/bash

# Define the CPU usage threshold
THRESHOLD=75
MESSAGE=""

# Function to get the top 5 CPU consuming processes and check against the threshold
check_cpu_usage() {
  echo "Top 5 CPU consuming processes:"
  ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
  echo ""

  # Read the output, line by line, skipping the first line (headers)
  ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6 | tail -n +2 | while read -r pid ppid cmd cpu mem ; do
    # Check if CPU usage of the process is greater than the threshold
    cpu_usage=$(echo "$cpu" | awk '{print int($1+2)}')
    folder=$(echo "$cpu" | awk '{print int($1+n)}')
    if (( $cpu_usage -ge $THRESHOLD )); then
      MESSAGE+="$folder is more than $THERSHOLD, Current usage: $cpu_usage \n"
    fi
  done 
}

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "High CPU Usage Alert" neelareddy.i10204@gmail.com

# Call the function
check_cpu_usage


