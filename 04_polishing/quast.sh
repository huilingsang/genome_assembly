#!/bin/bash
#SBATCH --job-name=quast.sh
#SBATCH -o quast.out
#SBATCH -e quast.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=24 #Note: you are always allocated an even number of cpus
#SBATCH --mem=48G
#SBATCH --time=05:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate quast

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/hifiasm/simplex_q8_h50/consensus.fasta
REF=/nfs/scratch/sanghu/johndory/chap2_ref_genome/uk_genome/ref_genome/GCA_960531495.1_fZeuFab8.1_genomic.fna
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/hifiasm/simplex_q8_h50/quast

mkdir $OUT_DIR

quast.py -o $OUT_DIR -r $REF -t 24 --fragmented $ASM
