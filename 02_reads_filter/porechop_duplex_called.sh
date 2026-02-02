#!/bin/bash
#SBATCH --job-name=porechop_duplex_called.sh
#SBATCH -o porechop_duplex_called.out
#SBATCH -e porechop_duplex_called.err
#SBATCH --partition=bigmem
#SBATCH --cpus-per-task=60 #Note: you are always allocated an even number of cpus
#SBATCH --mem=360G
#SBATCH --time=3-00:00:00

module load htslib/1.10.1

porechop_runner=/nfs/home/sanghu/shl/software/Porechop/porechop-runner.py
INPUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/duplex_calling/fastq
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq

#$porechop_runner -i $INPUT_DIR/merged.simplex.fastq.gz -o $OUT_DIR/merged_simplex_porechop.fastq.gz
$porechop_runner -i $INPUT_DIR/merged.simplex_duplex.fastq.gz -o $OUT_DIR/merged.simplex_duplex.porechop.fastq.gz

