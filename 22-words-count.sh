#write a script that reads a text file and counts the occurence of each word, displaying the top 5 most frequent words along with their counts in shell script

#!/bin/bash

filename="text.sh"
R="\e[31m"
G="\e[32m"
N="\e[0m"


if [ ! -f "$filename" ] 
then
    echo -e "$R File does not exist $N"
    exit 1
else
    echo -e "$G File is exist $N"    
fi

word_count=$(wc -w < "$filename")

echo  "The number of words in $filename is: $word_count | head -n 5 "