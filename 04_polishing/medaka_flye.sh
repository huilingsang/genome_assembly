#!/bin/bash
#SBATCH --job-name=medaka_flye_simplex.sh
#SBATCH -o medaka_flye_simplex.out
#SBATCH -e medaka_flye_simplex.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=64 #Note: you are always allocated an even number of cpus
#SBATCH --mem=128G
#SBATCH --time=5-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate Medaka

FLYE_ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/simplex/q8/assembly.fasta
INPUT_FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq/simplex.porechop.nextflow.chopper_q8.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/flye/simplex_q8


medaka_consensus -d $FLYE_ASM -i $INPUT_FASTQ -o $OUT_DIR -m r1041_e82_400bps_sup_v4.1.0
