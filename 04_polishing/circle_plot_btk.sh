#!/bin/bash
#SBATCH --job-name=circle_plot_btk.sh
#SBATCH -o circle_plot_btk.out
#SBATCH -e circle_plot_btk.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=10 #Note: you are always allocated an even number of cpus
#SBATCH --mem=40G
#SBATCH --time=05:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate btk

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/flye/simplex_q7/consensus.fasta
BUSCO_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/flye/simplex_q7/busco/johndory/run_actinopterygii_odb10
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/flye/simplex_q7/circle_plot

mkdir $OUT_DIR
cd $OUT_DIR

blobtools create \
    --fasta $ASM \
    --busco $BUSCO_DIR/full_table.tsv \
    $OUT_DIR/Zeusfaber_JDO

blobtools view \
    --plot \
    --view snail \
    $OUT_DIR/Zeusfaber_JDO
