#!/bin/bash
#SBATCH --job-name=flye_mito.sh
#SBATCH -o flye_mito.out
#SBATCH -e flye_mito.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=16 #Note: you are always allocated an even number of cpus
#SBATCH --mem=32G
#SBATCH --time=05:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate Flye

INPUT_READS=/nfs/scratch/sanghu/johndory/chap2_ref_genome/mito_assembly/assembly_mito/mito_reads.fastq
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/mito_assembly/assembly_mito/flye_mito

#mkdir $OUT_DIR

flye --nano-hq $INPUT_READS --genome-size 17k --out-dir $OUT_DIR --threads 16 --keep-haplotypes
