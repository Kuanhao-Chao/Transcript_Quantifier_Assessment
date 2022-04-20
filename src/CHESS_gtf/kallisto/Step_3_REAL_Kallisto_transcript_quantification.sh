for tissue in 0 1 2
#for tissue in 0
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    #for sample in 0
    do
        #echo $sample
        for category in real
        #for category in intergenic
        do
            #echo $category
            kallisto quant -i /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/CHESS_results/kallisto/chess3.01_tx_index -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/CHESS_results/kallisto/tissue${tissue}/sample${sample}/real_tx_quant --single -l 101 -s 0.0001 /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/real.t${tissue}_s${sample}.fastq &
        done
    done
done
