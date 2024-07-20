#!/bin/bash
dir="/mnt/e/Science/HiC/Contact_files/Rebin/S288c" #provide the path to the directory containing rebinned graal format matrices
sample=("AD281_merged_S288c_DSB_cutsite_q20")
for SAMP in "${sample[@]}" ; do
  hicstuff view -b 1kb -m -4 -M -1.5 -T log10 -c YlOrBr -n -r chr5 -N 10 -o "Matrices/DSB/"$SAMP"_chr5_1kb_log_N10_m4M1.5.pdf" -f $dir"/"$SAMP"_1kb.frag.tsv" $dir"/"$SAMP"_1kb.mat.tsv";
  hicstuff view -b 15kb -m -4 -M -1.5 -T log10 -c YlOrBr -n -N 10 -o "Matrices/DSB/"$SAMP"_WG_15kb_log_N10_m4M1.5.svg" -f $dir"/"$SAMP"_1kb.frag.tsv" $dir"/"$SAMP"_1kb.mat.tsv";
done
