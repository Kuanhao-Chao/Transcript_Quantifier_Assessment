# Download NA12878_dRNA fastq & bam file
wget https://s3.amazonaws.com/nanopore-human-wgs/rna/fastq/NA12878-DirectRNA.pass.dedup.fastq.gz
wget https://s3.amazonaws.com/nanopore-human-wgs/rna/bamFiles/NA12878-DirectRNA.pass.dedup.NoU.fastq.hg38.minimap2.sorted.bam
wget https://s3.amazonaws.com/nanopore-human-wgs/rna/bamFiles/NA12878-DirectRNA.pass.dedup.NoU.fastq.hg38.minimap2.sorted.bam.bai
mv NA12878-DirectRNA.pass.dedup.fastq.gz /ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/long_reads
mv NA12878-DirectRNA.pass.dedup.NoU.fastq.hg38.minimap2.sorted.bam /ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/bam

# Download NA12878_cDNA bam file
wget https://s3.amazonaws.com/nanopore-human-wgs/rna/fastq/NA12878-cDNA-1D.pass.dedup.fastq
wget https://s3.amazonaws.com/nanopore-human-wgs/rna/bamFiles/NA12878-cDNA-1D.pass.dedup.fastq.hg38.minimap2.sorted.bam
wget https://s3.amazonaws.com/nanopore-human-wgs/rna/bamFiles/NA12878-cDNA-1D.pass.dedup.fastq.hg38.minimap2.sorted.bam.bai
mv NA12878-cDNA-1D.pass.dedup.fastq /ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/long_reads
mv NA12878-cDNA-1D.pass.dedup.fastq.hg38.minimap2.sorted.bam /ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/bam

# Download SRR1163655 PacBio cDNA
prefetch SRR1163655
fasterq-dump --split-files /home/kh.chao/ncbi/public/sra/SRR1163655.sra
mv /home/kh.chao/ncbi/public/sra/SRR1163655.sra.fastq /ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/long_reads

# Download SRR1153470 Illumina short reads
prefetch SRR1153470
fasterq-dump --split-files /home/kh.chao/ncbi/public/sra/SRR1153470.sra
mv /home/kh.chao/ncbi/public/sra/SRR1153470.sra_* /ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/short_reads

# Download SRR4235527 Illumina short reads
prefetch SRR4235527
fasterq-dump --split-files /home/kh.chao/ncbi/public/sra/SRR4235527.sra
mv /home/kh.chao/ncbi/public/sra/SRR4235527.sra_* /ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/short_reads
