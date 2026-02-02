#!/bin/bash
#SBATCH --job-name=hifiasm_basecalled.sh
#SBATCH -o hifiasm_basecalled.out
#SBATCH -e hifiasm_basecalled.err
#SBATCH --partition=gpu
#SBATCH --cpus-per-task=100 #Note: you are always allocated an even number of cpus
#SBATCH --mem=200G
#SBATCH --time=1-00:00:00


eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate hifiasm 

INPUT_FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/basecalled/fastq/basecalled_all_reads_porechop_nextflow_chopper_h50_t50.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/hifiasm/basecalled/h50_t50

mkdir $OUT_DIR

hifiasm -t 100 --ont -o $OUT_DIR/basecalled_h50_t50.hifiasm $INPUT_FASTQ

