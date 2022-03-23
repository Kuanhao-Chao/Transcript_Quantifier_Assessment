# Multi-map-Reads-Distributor
A pipeline to redistribute multi-mapped short reads to StringTie-assembled transcripts with the guidance of Salmon

## Data

We collected three long-read and two short-read datasets. Here is the path to the datasets on the server: `/ccb/salz3/kh.chao/PR_StringTie_Quantification_Fix/data/human`

### Long-read
1. NA12878-cDNA (ONT complementary DNA)
2. NA12878-dRNA (ONT direct RNA)
3. SRR1163655 (PacBio cDNA)

### Short-read
1. SRR1153470 (Illumina HiSeq 2000)
2. SRR4235527 (Illumina Genome Analyzer IIx)
---

## Teammate
* Peter Ge
* Kuan-Hao Chao
--

## Reference
1. Workman, R. E., Tang, A. D., Tang, P. S., Jain, M., Tyson, J. R., Razaghi, R., ... & Timp, W. (2019). Nanopore native RNA sequencing of a human poly (A) transcriptome. Nature methods, 16(12), 1297-1305.
2. Shumate, A., Wong, B., Pertea, G., & Pertea, M. (2021). Improved Transcriptome Assembly Using a Hybrid of Long and Short Reads with StringTie. bioRxiv.
