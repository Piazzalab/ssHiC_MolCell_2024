#!/bin/sh
genome="S288c_DSB_LY_Capture_artificial" 
thread=5 #indicate the number of thread for sshicstuff to use
sparsedir='/mnt/e/Science/ssHiC/Contact_files/Sparse/S288c/' #path to folder containing the sparse ssHi-C data in graal format generated from read pairs by Hicstuff pipeline
inputdir='/mnt/e/Science/ssHiC/Inputs/' #path to folder containg the ssHiCstuff input files
outputdir='/mnt/e/Science/ssHiC/Samples/' #path for ssHiC output 
hicstuff_version='v312'

SAMP=("AD296") #List sample to process
for sample in "${SAMP[@]}" ; do
  name=$sample'_'$genome'_cutsite_q20' #add the suffix to sample name
  mkdir $outputdir$name'_'$hicstuff_version;

  sshicstuff pipeline -c $inputdir'capture_oligo_positions.csv' -C $inputdir'S288c_chr_centro_coordinates.tsv' -f $inputdir'fragments_list_S288c_DSB_LY_Capture_artificial_DpnIIHinfI.txt' -a $inputdir'additional_probe_groups.tsv' -b 1000 -b 2000 -b 5000 -b 10000 -F -I -L -N -n 2 -E chr2 -E chr3 -E chr5 -E 2_micron -E mitochondrion --binning-aggregate-cen 10000 --binning-aggregate-telo 1000 --window-size-cen 150000 --window-size-telo 15000 -o $outputdir$name --copy-inputs -m $sparsedir$name'.txt'
  
  #rm -r $sample'/'

done
