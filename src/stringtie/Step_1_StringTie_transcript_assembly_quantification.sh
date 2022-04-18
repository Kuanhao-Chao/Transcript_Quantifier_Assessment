for tissue in 0 1 2
do
    #echo $tissue
    for sample in 0 1 2 3 4 5 6 7 8 9
    do
        #echo $sample
        for category in intergenic intronic real splicing
        do
            #echo $category
            mkdir -p /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/stringtie/tissue${tissue}/sample${sample}/
            stringtie -c 1 -f 0.01 -j 1 -m 200 -a 10 -p 40 -G /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_experiments/tissue$tissue/sample$sample/${category}.t${tissue}_s${sample}.sorted.gtf -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/stringtie/tissue${tissue}/sample${sample}/out_${category}.t${tissue}_s${sample}.sorted.gtf -l ${category}_t${tissue}_s${sample} --cram-ref /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa -A /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/stringtie/tissue$tissue/sample$sample/out_${category}_abundance.t${tissue}_s${sample}.tab /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue$tissue/sample$sample/${category}.t${tissue}_s${sample}.cram &
        done
    done
done

#stringtie -c 1 -f 0.01 -j 1 -m 200 -a 10 -p 40 -G /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_experiments/tissue0/sample0/intergenic.t0_s0.sorted.gtf -o /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/stringtie/tissue0/sample0/out_intergenic.t0_s0.sorted.gtf -l intergenic_t0_s0 --cram-ref /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/hg38_p12_ucsc.no_alts.no_fixs.fa -A /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/Assembler_Quantification_Assessment/results/stringtie/tissue0/sample0/out_intergenic_abundance.t0_s0.tab  /ccb/salz3/kh.chao/PR_Assembler_Quantification_Assessment/data/simulated_data/simulated_reads/tissue0/sample0/intergenic.t0_s0.cram
