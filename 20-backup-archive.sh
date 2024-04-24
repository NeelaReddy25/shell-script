#!/bin/bash

# Defining variables
SOURCE_DIRECTORY=/tmp/applog-files
DESTINATION_DIRECTORY=/tmp/files-log
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TARFILE=/tmp/files-log/$SCRIPT_NAME-$TIMESTAMP.tar.gz
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $DESTINATION_DIRECTORY]
then
    echo -e "$G Destination directory exists $N"
else
    echo -e "$R Please make sure $DESTINATION_DIRECTORY exists $N"
    exit 1
fi    

# Archive the source diretory
FILES=$(tar -czf "$DESTINATION_DIRECTORY/$TIMESTAMP/$TARFILE" "$SOURCE_DIRECTORY")

while IFS= read -r line
do
  echo "Archeving file: $line"
done <<< $FILES

if [ $? -eq 0 ]
then 
    echo -e "$R Backup Failure: $SCRIPT_NAME $N"
else
    echo -e "$G Backup Success: $SCRIPT_NAME $N" 
fi       



    





