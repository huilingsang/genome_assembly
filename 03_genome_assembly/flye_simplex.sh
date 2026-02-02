#!/bin/bash
#SBATCH --job-name=flye_simplex.sh
#SBATCH -o flye_simplex.out
#SBATCH -e flye_simplex.err
#SBATCH --partition=bigmem
#SBATCH --cpus-per-task=32 #Note: you are always allocated an even number of cpus
#SBATCH --mem=200G
#SBATCH --time=5-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

#/nfs/home/oostinto/bin/Flye/bin/flye --nano-hq /nfs/scratch/oostinto/projects/johndory/output/assemblies/johndory_v1/johndory_v1.fastq.gz \
#--out-dir /nfs/scratch/oostinto/projects/johndory/output/assemblies/johndory_v1/flye/1_flye \
#--genome-size 0.65g --threads 10 --read-error 0.03 --min-overlap 1000 --no-alt-contigs --scaffold

conda activate Flye

INPUT_READS=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq/simplex.porechop.nextflow.chopper_h50.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/simplex/h50

mkdir $OUT_DIR

flye --nano-hq $INPUT_READS --out-dir $OUT_DIR --genome-size 0.8g --threads 32 --read-error 0.03 --no-alt-contigs --scaffold
