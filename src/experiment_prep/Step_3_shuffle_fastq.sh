for tissue in 0 1 2
do
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        #echo $category
        echo "/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/bin/shuffle.sh in=/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.fastq out=/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}_shuffled.fastq &"
        /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/bin/bbmap/shuffle.sh in=/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.fastq out=/ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}_shuffled.fastq &
    done
done
