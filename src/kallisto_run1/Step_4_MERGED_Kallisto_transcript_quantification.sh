for tissue in 2
#for tissue in 0
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    #for sample in 0
    do
        #echo $category
        echo "kallisto quant -i /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/kallisto/tissue${tissue}/sample${sample}/real_tx_index -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/kallisto/tissue${tissue}/sample${sample}/merged_tx_quant --single -l 101 -s 0.01 /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.fastq &"
        kallisto quant -i /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/kallisto/tissue${tissue}/sample${sample}/real_tx_index -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/kallisto/tissue${tissue}/sample${sample}/merged_tx_quant --single -l 101 -s 0.01 /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.fastq &
    done
done
