for tissue in 0 1 2
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        for category in intergenic intronic real splicing
        do
            #echo $category
            salmon index -t /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/salmon/tissue${tissue}/sample${sample}/${category}_transcripts.fa -i /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/salmon/tissue${tissue}/sample${sample}/${category}_tx_index -k 31 &
        done
    done
done
