#!/bin/bash
#SBATCH --job-name=nanoplot.sh
#SBATCH -o nanoplot.out
#SBATCH -e nanoplot.err
#SBATCH --partition=bigmem
#SBATCH --cpus-per-task=20 #Note: you are always allocated an even number of cpus
#SBATCH --mem=40G
#SBATCH --time=05-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate Python_Env

INPUT_FASTQ=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/chopper_fastq/simplex.porechop.nextflow.chopper_q7.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/02_reads_filter/duplex_called/nanoplot/simplex/q7

#mkdir -p $OUT_DIR

#NanoPlot --fastq $RAW_READ_DIR/all_libs_reads.fastq.gz -o $OUT_DIR/basecalled_all_reads_raw 
#NanoPlot --fastq $FILTERED_READ_DIR/basecalled_all_reads_p_nextflow_chopper_q8.fastq.gz -o $OUT_DIR/q8 
#NanoPlot -t 10 --N50 --dpi 300 --fastq $FILTERED_READ_DIR/nextflow_basecalled/clean/all_libs_reads_porechop.fastq.gz -o $OUT_DIR/p_nextflow_cleaned --plots kde hex dot 
#NanoPlot -t 10 --N50 --dpi 300 --fastq $FILTERED_READ_DIR/basecalled_all_reads_p_nextflow_chopper_q9.fastq.gz -o $OUT_DIR/q9 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q15_h50_t50.fastq.gz -o $OUT_DIR/q15_h50_t50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q10_h50_t50.fastq.gz -o $OUT_DIR/q10_h50_t50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q9_h50.fastq.gz -o $OUT_DIR/q9_h50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q8.fastq.gz -o $OUT_DIR/q8 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q7.fastq.gz -o $OUT_DIR/q7 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/nextflow_simplex/clean/merged_simplex_porechop.fastq.gz -o $OUT_DIR/p_nextflow --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q8_h50_t50.fastq.gz --loglength -o $OUT_DIR/q8_h50_t50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q9_h50_t50.fastq.gz --loglength -o $OUT_DIR/q9_h50_t50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_q11_h50_t50.fastq.gz --loglength -o $OUT_DIR/q11_h50_t50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_h50_t50.fastq.gz --loglength -o $OUT_DIR/h50_t50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/simplex.p.nextflow.chopper_h50.fastq.gz --loglength -o $OUT_DIR/h50 --plots kde hex dot
#NanoPlot -t 10 --N50 --dpi 300 --fastq $READ_DIR/nextflow_simplex/clean/merged_simplex_porechop.fastq.gz --loglength -o $OUT_DIR/p_nextflow --plots kde hex dot
NanoPlot -t 20 --N50 --dpi 300 --fastq $INPUT_FASTQ --loglength -o $OUT_DIR --plots kde hex dot
