# local variables
HOME=/ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/Multi-map-Reads-Distributor
DATA=/ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data
GENOME=$DATA/genome
RESULT=$HOME/results

# make directory
mkdir -p $DATA/hisat2_index

# convert chromosome names of UCSC Database to Ensembl Annotation
awk 'BEGIN{OFS="\t"} {if($2 ~ /^chr/) {$2 = substr($2, 4)}; if($2 == "M") {$2 = "MT"} print}' $GENOME/snp151Common.txt > $GENOME/snp151Common.txt.ensembl

# prepare splice sites, exons, snps, and haplotypes 
hisat2_extract_splice_sites.py $GENOME/gencode.v39.annotation.gtf > $GENOME/gencode.v39.ss
hisat2_extract_exons.py $GENOME/gencode.v39.annotation.gtf > $GENOME/gencode.v39.exon
hisat2_extract_snps_haplotypes_UCSC.py $GENOME/GRCh38.p13.genome.fa $GENOME/snp151Common.txt.ensembl $GENOME/GRCh38.p13

# build HGFM index with SNPs and transcripts
hisat2-build -p 16 \
    --snp $GENOME/GRCh38.p13.snp --haplotype $GENOME/GRCh38.p13.haplotype \
    --exon $GENOME/gencode.v39.exon --ss $GENOME/gencode.v39.ss \
    $GENOME/GRCh38.p13.genome.fa $DATA/hisat2_index/grch38_gencode_v39_snp_tran > $RESULT/hisat2-build.out
