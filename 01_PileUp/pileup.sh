#!/bin/bash

# 1. Load modules.
module load samtools/1.10
module load tabix/0.2.6
module load r/4.2.2

# 2. Create variables for directories.
ref=/home/path/to/dir/hg19_reference
source=/home/path/to/dir/source
sequenza=/home/path/to/dir/Sequenza
source_script=/home/path/to/dir/scripts

# 3. Run Sequenza - pileup.
# ----- a) Generate wiggle file - hg19 reference.
sequenza-utils gc_wiggle \
--fasta $ref/Homo_sapiens.hg19.fa \
-o $source/Sequenza_universal_hg19.wig.gz

# ---------- b) Generate seqz file with CNV numerical data.
sequenza-utils bam2seqz \
-n $source/bam1_sorted_nodup_aln.bam \
-t $source/bam2_sorted_nodup_aln.bam \
--fasta $ref/Homo_sapiens.hg19.fa \
-gc $source/Sequenza_universal_hg19.wig.gz \
-o $source/bam2_out.seqz.gz \
--samtools /home/path/to/dir/miniconda3/bin/samtools

# ---------- c) Generate output, which will be the input for the subsequent CNV analysis in R.
sequenza-utils seqz_binning \
--seqz $source/bam2_out.seqz.gz \
-w XX \
-o $source/bam2_out_small.seqz.gz

# 4. Execute the Rscript for segment analysis.
Rscript $source_script/segments_analysis.sh

# The end.
