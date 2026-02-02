#!/bin/bash
#SBATCH --job-name=duplex_bam_2_fastq.sh
#SBATCH -o duplex_bam_2_fastq.out
#SBATCH -e duplex_bam_2_fastq.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=20 #Note: you are always allocated an even number of cpus
#SBATCH --mem=40G
#SBATCH --time=10-00:00:00

module load GCC/12.3.0
module load SAMtools/1.19.2
module load htslib/1.10.1

BAM_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/duplex_calling/bam
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/duplex_calling/fastq

#samtools cat -o $BAM_DIR/merged.bam $BAM_DIR/lib1_duplex_channel.bam $BAM_DIR/lib2_duplex_channel.bam

#samtools view -b $BAM_DIR/merged.bam -d dx:0 -d dx:-1 | samtools fastq | bgzip -@ 20 -c > $OUT_DIR/merged.simplex.fastq.gz

#samtools view -b $BAM_DIR/merged.bam -d dx:1 | samtools fastq | bgzip -@ 20 -c > $OUT_DIR/merged.duplex.fastq.gz

samtools view -b $BAM_DIR/merged.bam -d dx:0 -d dx:1 | samtools fastq | bgzip -@ 20 -c > $OUT_DIR/merged.simplex_duplex.fastq.gz
