#!/bin/bash
#SBATCH --job-name=flye_basecalled.sh
#SBATCH -o flye_basecalled.out
#SBATCH -e flye_basecalled.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=64 #Note: you are always allocated an even number of cpus
#SBATCH --mem=200G
#SBATCH --time=4-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

#/nfs/home/oostinto/bin/Flye/bin/flye --nano-hq /nfs/scratch/oostinto/projects/johndory/output/assemblies/johndory_v1/johndory_v1.fastq.gz \
#--out-dir /nfs/scratch/oostinto/projects/johndory/output/assemblies/johndory_v1/flye/1_flye \
#--genome-size 0.65g --threads 10 --read-error 0.03 --min-overlap 1000 --no-alt-contigs --scaffold

conda activate Flye

INPUT_READS=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/basecalled/fastq/nextflow/clean/all_libs_reads_porechop.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/basecalled/nextflow

mkdir $OUT_DIR

flye --nano-hq $INPUT_READS --out-dir $OUT_DIR --genome-size 0.8g --threads 64 --read-error 0.03 --no-alt-contigs --scaffold
