#!/bin/sh
sample=$1
awk '!/mitochondrion/' $sample'.txt' > tmpfile && mv tmpfile $sample'_woMito.txt';
awk '!/2_micron/' $sample'_woMito.txt' > tmpfile && mv tmpfile $sample'_chr.txt';
