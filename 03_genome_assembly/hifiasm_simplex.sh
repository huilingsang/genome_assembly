#!/bin/bash
#SBATCH --job-name=hifiasm_simplex.sh
#SBATCH -o hifiasm_simplex.out
#SBATCH -e hifiasm_simplex.err
#SBATCH --partition=gpu
#SBATCH --cpus-per-task=100 #Note: you are always allocated an even number of cpus
#SBATCH --mem=200G
#SBATCH --time=1-00:00:00


eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate hifiasm 

INPUT_FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq/simplex.porechop.nextflow.chopper_q7_h50_t50.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/hifiasm/simplex/q7_h50_t50

mkdir $OUT_DIR

hifiasm -t 100 --ont -o $OUT_DIR/simplex_q7_h50_t50.hifiasm $INPUT_FASTQ

