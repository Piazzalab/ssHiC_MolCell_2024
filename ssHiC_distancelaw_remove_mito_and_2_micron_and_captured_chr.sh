#!/bin/sh
sample=$1
awk '!/mitochondrion/' $sample'.txt' > tmpfile && mv tmpfile $sample'_woMito.txt';
awk '!/2_micron/' $sample'_woMito.txt' > tmpfile && mv tmpfile $sample'_chr.txt';
awk '!/chr_artificial/' $sample'_chr.txt' > tmpfile && mv tmpfile $sample'_chr.txt';
awk '!/chr5/' $sample'_chr.txt' > tmpfile && mv tmpfile $sample'_chr_filtered.txt';
awk '!/chr2/' $sample'_chr_filtered.txt' > tmpfile && mv tmpfile $sample'_chr_filtered.txt';
awk '!/chr8/' $sample'_chr_filtered.txt' > tmpfile && mv tmpfile $sample'_chr_filtered.txt';
awk '!/chr10/' $sample'_chr_filtered.txt' > tmpfile && mv tmpfile $sample'_chr_filtered.txt';
awk '!/chr15/' $sample'_chr_filtered.txt' > tmpfile && mv tmpfile $sample'_chr_filtered.txt';
awk '!/chr4/' $sample'_chr_filtered.txt' > tmpfile && mv tmpfile $sample'_chr_filtered.txt';
