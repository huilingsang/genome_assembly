#!/bin/bash
#SBATCH --job-name=mafft.sh
#SBATCH -o mafft.out
#SBATCH -e mafft.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=50 #Note: you are always allocated an even number of cpus
#SBATCH --mem=100G
#SBATCH --time=1-00:00:00

module load GCC/10.2.0
module load MAFFT/7.475-with-extensions

WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteins_newest2/primary_transcripts/OrthoFinder_simple
Ortho_DIR=$WORK_DIR/Results_Dec17/Single_Copy_Orthologue_Sequences
OUT_DIR=$WORK_DIR/mafft_out

mkdir $OUT_DIR

for fa in $Ortho_DIR/*.fa; do
    filename=$(basename "$fa" .fa)
    mafft --thread 50 --auto "$fa" > "$OUT_DIR/${filename}.aln.fa"
done

