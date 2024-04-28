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
    
