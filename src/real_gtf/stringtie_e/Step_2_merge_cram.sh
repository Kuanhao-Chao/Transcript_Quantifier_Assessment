for tissue in 0 1 2
do
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        #echo $category
        echo "samtools merge -@ 40 --reference /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intergenic.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intronic.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/real.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/splicing.t${tissue}_s${sample}.cram &"
        samtools merge -@ 40 --reference /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/merged.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intergenic.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/intronic.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/real.t${tissue}_s${sample}.cram /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/splicing.t${tissue}_s${sample}.cram &
    done
done