#!/bin/bash

SOURCE_DIRECTORY="/home/ec2-user/shell-script"
DESTINATION_DIRECTORY="/home/ec2-user/shell-script/backups"
TIMESTAMP=$(date +%F-%H-%M-%S)
BACKUP_FILENAME="${DESTINATION_DIRECTORY}/backup_${TIMESTAMP}.tar.gz"
R="\e[31m"
G="\e[32m"
N="\e[0m"


if [ -d "SOURCE_DIRECTORY" ] 
then
     echo -e "$G Source directory exists $N"
else
    echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
    exit 1
fi


if [ -d DESTINATION_DIRECTORY ] 
then
    mkdir -p "$DESTINATION_DIRECTORY"

fi

tar -czvf "$BACKUP_FILENAME" "$SOURCE_DIRECTORY"


if [ $? -eq 0 ] 
then
    echo -e "Backup ....$G SUCCESS. Archive saved as: $BACKUP_FILENAME $N"
else
    echo -e "Backup....$R FAILURE $N"
fi




    





