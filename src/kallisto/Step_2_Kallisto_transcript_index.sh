for tissue in 0 1 2
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        for category in real
        do
            #echo $category
            kallisto index -k 31 -i /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/kallisto/tissue${tissue}/sample${sample}/${category}_tx_index /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/kallisto/tissue${tissue}/sample${sample}/${category}_transcripts.fa &
        done
    done
done
