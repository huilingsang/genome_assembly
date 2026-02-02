#!/bin/bash
#SBATCH --job-name=nextflow_duplex_called.sh
#SBATCH -o nextflow_duplex_called.out
#SBATCH -e nextflow_duplex_called.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=40 #Note: you are always allocated an even number of cpus
#SBATCH --mem=100G
#SBATCH --time=10-00:00:00

module load Java/17.0.4
module load GCC/10.2.0
module load OpenMPI/4.0.5
module load Singularity/3.10.2

INPUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/nextflow/simplex_duplex

cd $OUT_DIR

nextflow run rki-mf1/clean -r v1.1.2 \
	--input_type nano \
	--input $INPUT_DIR/merged.simplex_duplex.porechop.fastq.gz \
	--control dcs \
	--output $OUT_DIR \
	-profile singularity
