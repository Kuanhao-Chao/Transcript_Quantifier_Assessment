for tissue in 0 1 2
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        mkdir -p /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/CHESS_results/stringtie_e/tissue${tissue}/sample${sample}/merged/
        echo "stringtie -c 1 -f 0.01 -j 1 -m 200 -a 10 -p 40 -G /ccb/salz2/CHESS3/chess3.01.gtf -e -B -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/CHESS_results/stringtie_e/tissue${tissue}/sample${sample}/merged/out_merged.t${tissue}_s${sample}.sorted.gtf -l merged_t${tissue}_s${sample} --cram-ref /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa -A /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue$tissue/sample$sample/merged.t${tissue}_s${sample}.cram &"
        stringtie -c 1 -f 0.01 -j 1 -m 200 -a 10 -p 40 -G /ccb/salz2/CHESS3/chess3.01.gtf -e -B -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/CHESS_results/stringtie_e/tissue${tissue}/sample${sample}/merged/out_merged.t${tissue}_s${sample}.sorted.gtf -l merged_t${tissue}_s${sample} --cram-ref /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa -A /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/stringtie_e/tissue$tissue/sample$sample/merged/out_merged_abundance.t${tissue}_s${sample}.tab  /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue$tissue/sample$sample/merged.t${tissue}_s${sample}.cram &
    done
done

