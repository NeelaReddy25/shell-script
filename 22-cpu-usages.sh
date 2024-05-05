#diplay the top 5 cpu consuming process in linux, send alert if reaches more than thershold

#!/bin/bash

THRESHOLD=90

check_cpu_usage() {
  echo "Top 5 CPU consuming processes:"
  ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
  echo ""

  ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6 | tail -n +5 | while read -r pid ppid cmd cpu mem ; do
    cpu_usage=$(echo "$cpu" | awk '{print int($1+2)}')
    folder=$(echo "$cpu" | awk '{print int($1+n)}')
    if (( $cpu_usage > $THRESHOLD )); then
      MESSAGE+="$folder is more than $THERSHOLD, Current usage: $cpu_usage \n"
    fi
  done 
}

echo "Process with PID $pid is using $cpu% CPU, which is above the threshold of $THRESHOLD%" | mail -s "High CPU Usage Alert" neelareddy.i10204@gmail.com


check_cpu_usage


