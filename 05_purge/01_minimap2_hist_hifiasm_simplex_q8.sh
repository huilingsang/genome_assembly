#!/bin/bash
#SBATCH --job-name=01_minimap2_hist_hifiasm_simplex_q8.sh
#SBATCH -o 01_minimap2_hist_hifiasm_simplex_q8.out
#SBATCH -e 01_minimap2_hist_hifiasm_simplex_q8.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=64 #Note: you are always allocated an even number of cpus
#SBATCH --mem=128G
#SBATCH --time=03-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate purge_haplotigs

FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/fastq/simplex.porechop.nextflow.chopper_q8.fastq.gz
ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/05_exclude_mito/medaka_nuclear.fa
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/06_purge/hifiasm_simplex_q8

samtools faidx $ASM

minimap2 -t 64 -ax map-ont $ASM $FASTQ | samtools sort -@ 64 -o $OUT_DIR/hifiasm_simplex_q8_medaka_nuclear.bam

samtools index $OUT_DIR/hifiasm_simplex_q8_medaka_nuclear.bam

purge_haplotigs hist -b $OUT_DIR/hifiasm_simplex_q8_medaka_nuclear.bam -g $ASM -t 64
