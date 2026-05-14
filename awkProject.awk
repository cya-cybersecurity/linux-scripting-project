#!/bin/awk -f

BEGIN {
        FS = " "
}
#print last element of each line after the first 3
NR > 3{
        print $NF
}