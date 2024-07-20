#!/bin/bash
subsample=24000000 #indicate the number of contacts to retain in the matrix
thread=8 #specify the number of threads to use
dir="/mnt/d/Science/Owncloud/Experiments/HiC/Chromosight/"#specify the directory where Chromosight input and output files are and will be located
dir_cool='/mnt/e/Science/HiC/Contact_files/Cool/S288c/' #specify the folder containing the matrices in cooler format binned at 1 kb
centro="_Centromeres/_S288c_centro_coordinates.bed2d" #directory containing the coordinates of the centromeres in bed2d format
centro_mChr5="_Centromeres/_S288c_centro_coordinates_minus_chr5.bed2d"  #directory containing the coordinates of the centromeres except CEN5 in bed2d format
centro_mChr3Chr5="_Centromeres/_S288c_centro_coordinates_minus_chr3chr5.bed2d" # #directory containing the coordinates of the centromeresexcept CEN3 and CEN5 in bed2d format
cen2cen="_Centromeres/_S288c_centro_chr7_others_coordinates.bed2d" #directory containing the intersection of CEN7 with other centromeres in bed2d format

sample=("AD265_S288c_DSB_cutsite_q20" "AD266_S288c_DSB_cutsite_q20") #specify the cooler file name. The names must be followed by the "_1kb.cool" suffix. do not include it here
for SAMP in "${sample[@]}" ; do
  chromosight quantify --pattern=borders --win-size=81 --perc-zero=100 --subsample=$subsample --threads=$thread $dir$centro $dir_cool$SAMP'_1kb.cool' $dir"_Centromeres/Centro_border/"$SAMP'_centro_pileup_win_81kb_subsample_'$subsample;
  chromosight quantify --pattern=borders --win-size=81 --perc-zero=100 --subsample=$subsample --threads=$thread $dir$centro_mChr5 $dir_cool$SAMP'_1kb.cool' $dir"_Centromeres/Centro_border/"$SAMP'_centro_pileup_win_81kb_minus_chr5_subsample_'$subsample;
  chromosight quantify --pattern=borders --win-size=81 --perc-zero=100 --subsample=$subsample --threads=$thread $dir$centro_mChr3Chr5 $dir_cool$SAMP'_1kb.cool' $dir"_Centromeres/Centro_border/"$SAMP'_centro_pileup_win_81kb_minus_chr3chr5_subsample_'$subsample;
  chromosight quantify --pattern=centromeres --inter --win-size=81 --perc-zero=100 --subsample=$subsample --threads=$thread $cen2cen $dir_cool$SAMP'_1kb.cool' $dir"_Centromeres/Centro_chr7_vs_other_centro/"$SAMP'_centromere_chr7_win_81kb_subsample_'$subsample;
done
