for tissue in 0 1 2
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        for category in intergenic intronic real splicing
        do
            #echo $category
            mkdir -p /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/CHESS_results/salmon/tissue${tissue}/sample${sample}/
        done
    done
done
gffread -w /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/CHESS_results/salmon/chess3.01.fa -g /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa /ccb/salz2/CHESS3/chess3.01.gtf &
