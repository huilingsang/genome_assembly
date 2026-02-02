#!/bin/bash
#SBATCH --job-name=medaka_hifiasm.sh
#SBATCH -o medaka_hifiasm.out
#SBATCH -e medaka_hifiasm.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=64 #Note: you are always allocated an even number of cpus
#SBATCH --mem=264G
#SBATCH --time=4-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate Medaka

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/hifiasm/simplex_q8/medaka_round2/consensus.fasta
FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/fastq/simplex.porechop.nextflow.chopper_q8.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/hifiasm/simplex_q8/medaka_round2/medaka_round3


medaka_consensus -d $ASM \
	-i $FASTQ \
	-o $OUT_DIR \
	-m r1041_e82_400bps_sup_v4.1.0
