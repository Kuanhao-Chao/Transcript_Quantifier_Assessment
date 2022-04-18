for tissue in 0 1 2
do
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        #echo $category
        echo "cat /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intergenic.t${tissue}_s${sample}.fastq /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intronic.t${tissue}_s${sample}.fastq /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/real.t${tissue}_s${sample}.fastq /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/splicing.t${tissue}_s${sample}.fastq > /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.fastq"
        cat /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intergenic.t${tissue}_s${sample}.fastq /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intronic.t${tissue}_s${sample}.fastq /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/real.t${tissue}_s${sample}.fastq /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/splicing.t${tissue}_s${sample}.fastq > /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.fastq &
    done
done
