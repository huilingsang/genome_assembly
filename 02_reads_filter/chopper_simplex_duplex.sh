#!/bin/bash
#SBATCH --job-name=chopper_simplex_duplex.sh
#SBATCH -o chopper_simplex_duplex.out
#SBATCH -e chopper_simplex_duplex.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=50 #Note: you are always allocated an even number of cpus
#SBATCH --mem=100G
#SBATCH --time=1-00:00:00


eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate chopper

INPUT_FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq/nextflow/simplex_duplex/clean/merged_simplex_duplex.porechop.nextflow.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq

#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper --tailcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_t50.fastq.gz
#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper -q 7 --tailcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_q7_t50.fastq.gz
#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper -q 8 --tailcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_q8_t50.fastq.gz
#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper -q 9 --tailcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_q9_t50.fastq.gz
#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper -q 10 --tailcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_q10_t50.fastq.gz
#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper -q 15 --tailcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_q15_t50.fastq.gz
#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper --headcrop 50 --tailcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_h50_t50.fastq.gz
#gunzip -c $INPUT_DIR/merged_simplex_porechop.fastq.gz | chopper --headcrop 50 -t 50 | gzip > $OUT_DIR/simplex.p.nextflow.chopper_h50.fastq.gz
#gunzip -c $INPUT_FASTQ | chopper -q 9 --headcrop 50 --tailcrop 50 -t 50 | gzip > $OUT_DIR/merged_simplex_duplex.porechop.nextflow.chopper_q9_h50_t50.fastq.gz
#gunzip -c $INPUT_FASTQ | chopper -q 7 -t 50 | gzip > $OUT_DIR/merged_simplex_duplex.porechop.nextflow.chopper_q7.fastq.gz
gunzip -c $INPUT_FASTQ | chopper --headcrop 50 -t 50 | gzip > $OUT_DIR/merged_simplex_duplex.porechop.nextflow.chopper_h50.fastq.gz
gunzip -c $INPUT_FASTQ | chopper --tailcrop 50 -t 50 | gzip > $OUT_DIR/merged_simplex_duplex.porechop.nextflow.chopper_t50.fastq.gz
gunzip -c $INPUT_FASTQ | chopper --headcrop 50 --tailcrop 50 -t 50 | gzip > $OUT_DIR/merged_simplex_duplex.porechop.nextflow.chopper_h50_t50.fastq.gz
