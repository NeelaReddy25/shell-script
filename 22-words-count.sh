#write a script that reads a text file and counts the occurence of each word, displaying the top 5 most frequent words along with their counts in shell script

#!/bin/bash

filename="text.txt"


if [ ! -f "$filename" ] 
then
    echo "File '$filename' not found."
    exit 1
fi

word_count=$(tr -s '[:space:]' '\n' < "$filename" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | grep -v '^$' | sort | uniq -c | sort -nr)

echo "Top 5 Most Frequent Words:"
echo "$word_count" | head -n 5 | awk '{print $2 " - " $1 " occurrences"}'

# word=$(echo -n "i am working has devops engineer " | wc -w)
# echo "Number of Words = $word" 