awk '
{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
    }
}
END {
    for (i=1; i<=NF; i++) {
        for (j=1; j<=NR; j++) {
            printf "%s%s", a[j,i], (j==NR ? "\n" : OFS)
        }
    }
}' file.txt


# Transpose rows and columns using rs
rs -T < input.txt
