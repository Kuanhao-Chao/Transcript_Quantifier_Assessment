# local variables
HOME=/ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/Multi-map-Reads-Distributor
DATA=/ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data

# make directory
mkdir -p $HOME/results/fastqc

# FastQC on short and long reads
fastqc -o $HOME/results/fastqc -t 6 $DATA/short_reads/* $DATA/long_reads/*
