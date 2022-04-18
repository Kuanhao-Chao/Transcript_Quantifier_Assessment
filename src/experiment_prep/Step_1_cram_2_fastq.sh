for tissue in 0 1 2
do
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        for category in intergenic intronic real splicing
        do
            #echo $category
            samtools bam2fq /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/${category}.t${tissue}_s${sample}.cram --reference /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa > /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue${tissue}/sample${sample}/${category}.t${tissue}_s${sample}.fastq &
        done
    done
done
