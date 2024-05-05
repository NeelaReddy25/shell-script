#Convert rows into columns and columns into rows

#!/bin/bash

G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e " $Y Convert Rows to Columns $N"
awk '
{
  for (i=1; i<=NF; i++) {
    if(NR==1) {
      s[i] = $i;
    } else {
      s[i] = s[i] " " $i;
    }
  }
}
END {
  for (i=1; i<=NF; i++) {
    print s[i];
  }
}' file.txt

echo -e "$G Convert Columns to Rows $N"
awk '
{
  for (i=1; i<=NF; i++) {
    a[NR,i] = $i
  }
}
END {
  for (i=1; i<=NF; i++) {
    for (j=1; j<=NR; j++) {
      printf "%s%s", a[j,i], (j==NR ? RS : FS)
    }
  }
}' files.txt
