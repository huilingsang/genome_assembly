#!/bin/bash
#SBATCH --job-name=circle_plot_btk.sh
#SBATCH -o circle_plot_btk.out
#SBATCH -e circle_plot_btk.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=10 #Note: you are always allocated an even number of cpus
#SBATCH --mem=20G
#SBATCH --time=5:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate btk

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/simplex_duplex/h50/assembly.fasta
BUSCO_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/simplex_duplex/h50/busco/johndory/run_actinopterygii_odb10
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/simplex_duplex/h50/circle_plot

mkdir -p $OUT_DIR
cd $OUT_DIR

blobtools create \
    --fasta $ASM \
    --busco $BUSCO_DIR/full_table.tsv \
    $OUT_DIR/Zeusfaber_JDO

blobtools view \
    --plot \
    --view snail \
    $OUT_DIR/Zeusfaber_JDO
