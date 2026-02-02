#!/bin/bash
#SBATCH --job-name=ragtag_scaffold.sh
#SBATCH -o ragtag_scaffold.out
#SBATCH -e ragtag_scaffold.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=40 #Note: you are always allocated an even number of cpus
#SBATCH --mem=80G
#SBATCH --time=05:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate ragtag

#ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/08_ragtag_nuclear/l20_m60_h200/ragtag_correct/ragtag.correct.fasta
ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/06_purge/hifiasm_simplex_q8/l20_m60_h200/hifiasm_simplex_q8_medaka_nuclear_purge.fasta
REF=/nfs/scratch/sanghu/johndory/chap2_ref_genome/uk_genome/ref_genome/uk_nuclear_genome.fasta
#OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/08_ragtag_nuclear/l20_m60_h200
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/07_ragtag_nuclear/l20_m60_h200/scaffold_only

ragtag.py scaffold -t 40 -r $REF $ASM -o $OUT_DIR
