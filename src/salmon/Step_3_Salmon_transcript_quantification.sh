for tissue in 0 1 2
#for tissue in 0
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    #for sample in 0
    do
        #echo $sample
        for category in intergenic intronic real splicing
        #for category in intergenic
        do
            #echo $category
            salmon quant -i /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/salmon/tissue${tissue}/sample${sample}/${category}_tx_index -l SF -r /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/${category}.t${tissue}_s${sample}.fastq --validateMappings -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/salmon/tissue${tissue}/sample${sample}/${category}_tx_quant &
        done
    done
done
