#!/bin/bash

# Set the threshold (e.g., 80%)
THRESHOLD=80

# Get the current CPU utilization
CPU_UTILIZATION=$(cat /proc/loadavg | awk '{print $1}')

# Compare with the threshold
if (( $(echo "$CPU_UTILIZATION > $THRESHOLD" | bc -l) ))
then
    echo "Current CPU Utilization is: $CPU_UTILIZATION%"
    mail -s "High CPU Alert" neelareddy.i10204@gmail.com <<< "CPU usage is above $THRESHOLD%."
fi


