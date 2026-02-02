#!/bin/bash

#SBATCH --job-name=bam_2_fastq.sh
#SBATCH -o bam_2_fastq.out
#SBATCH -e bam_2_fastq.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=10 #Note: you are always allocated an even number of cpus
#SBATCH --mem=20G
#SBATCH --time=10-00:00:00

module load GCC/12.3.0
module load SAMtools/1.19.2

bam_dir=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/bam
out_dir=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/fastq

samtools fastq $bam_dir/lib1_dorado_calls.bam > $out_dir/lib1_reads.fastq
samtools fastq $bam_dir/lib2_dorado_calls.bam > $out_dir/lib2_reads.fastq
