#!/bin/bash

# Defining variables
SOURCE_DIRECTORY=/tmp/applog-files
DESTINATION_DIRECTORY=/tmp/files
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TARFILE="$DESTINATION_DIRECTORY"/$SCRIPT_NAME-$TIMESTAMP.tar.gz
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $DESTINATION_DIRECTORY ]
then
    echo -e "$G Destination directory exists $N"
else
    echo -e "$R Please make sure $DESTINATION_DIRECTORY exists $N"
    exit 1
fi    

# Archive the source diretory
tar -czf "$DESTINATION_DIRECTORY/$TARFILE" "$SOURCE_DIRECTORY"


if [ $? -eq 0 ]
then 
    echo -e "$R Backup Failure: $TARFILE $N"
else
    echo -e "$G Backup Success: $TARFILE $N" 
fi       



    





