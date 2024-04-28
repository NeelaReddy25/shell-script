#!/bin/bash

PATH="/"
HOSTNAME=$(hostname)
CRITICAL=80
WARNING=75
CRITICALMAIL="neelareddy.i25@gmail.com"
WARNINGMAIL="neelareddy.i10204@gmail.com"
mkdir -d /var/log/cputilhist
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/var/log/cputilhist/cpusage-$TIMESTAMP.log

touch $LOGFILE

for path in $PATH
do 
    CPULOAD=`top -b -n 5 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' | awk -F . '{print $1}'`
if [ -n $WARNING -a -n $CRITICAL ]
then
if [ "$PULOAD" -ge "$WARNING" -a "$CPULOAD" -lt "$CRITICAL" ]
then
    echo "$TIMESTAMP WARNING - $CPULOAD on Host $HOSTNAME" &>>$LOGFILE
    echo "Warning Cpuload $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is Warning" $WARNINGMAIL
    exit 1
elif [ "$CPULOAD" -ge "$CRITICAL" ]
then
    echo "$TIMESTAMP CRITICAL- $CPULOAD on Host $HOSTNAME" &>>$LOGFILE
    echo "CRITICAL Cpuload $CPULOAD Host is $HOSTNAME" | mail -s "CPULOAD is CRITICAL" $CRITICALMAIL
    exit 2   
else
    echo "$TIMESTAMP  OK - $CPULOAD on $HOSTNAME" &>>$LOGFILE
fi
fi                 
done