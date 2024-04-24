#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THERSHOLD=6

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $Disk_THERSHOLD ]
    then
      echo "$FOLDER is more than $Disk_THERSHOLD, Current usage: $USAGE"
    fi
done <<< $Disk_USAGE
   
