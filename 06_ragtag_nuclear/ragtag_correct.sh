#!/bin/bash
#SBATCH --job-name=ragtag_correct_hifiasm.sh
#SBATCH -o ragtag_correct_hifiasm.out
#SBATCH -e ragtag_correct_hifiasm.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=60 #Note: you are always allocated an even number of cpus
#SBATCH --mem=120G
#SBATCH --time=05:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate ragtag

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/06_purge/hifiasm_simplex_q8/l20_m60_h200/hifiasm_simplex_q8_medaka_nuclear_purge.fasta
FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/fastq/simplex.porechop.nextflow.chopper_q8.fastq.gz
REF=/nfs/scratch/sanghu/johndory/chap2_ref_genome/uk_genome/ref_genome/uk_nuclear_genome.fasta
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/08_ragtag_nuclear/l20_m60_h200

ragtag.py correct -t 60 $REF $ASM -o $OUT_DIR/ragtag_correct -R $FASTQ -T ont
