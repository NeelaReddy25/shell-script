#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)

cpuuse=$(cat /proc/loadavg | awk '{print $3}' | cut -f 1 -d ".")

if [ "$cpuuse" -ge 90 ]; then
    SUBJECT="ATTENTION: CPU load is high on $(hostname) at $(TIMESTAMP)"
    MESSAGE="/tmp/Mail.out"
    TO="neelareddy.i25@gmail.com"
    echo "CPU current usage is: $cpuuse%" >> $MESSAGE
    echo "" >> $MESSAGE
    echo "+------------------------------------------------------------------+" >> $MESSAGE
    echo "Top 20 processes consuming high CPU" >> $MESSAGE
    ps --sort=-pcpu | head -n 6 >> $MESSAGE
    mail -s "$SUBJECT" $TO < $MESSAGE
fi

*/5 * * * * /usr/bin/cat /proc/loadavg | awk '{print $1}' | awk '{ if($1 > 80) printf("Current CPU Utilization is: %.2f%%\n"), $0;}' | mail -s "High CPU Alert" neelareddy.i10204@gmail.com