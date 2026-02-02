#!/bin/bash
#SBATCH --job-name=trimAL.sh
#SBATCH -o trimAL.out
#SBATCH -e trimAL.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=12 #Note: you are always allocated an even number of cpus
#SBATCH --mem=24G
#SBATCH --time=1-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate trimAL

WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteins_newest2/primary_transcripts/OrthoFinder_simple
MAFFT_OUT=$WORK_DIR/mafft_out
TRIMAL_OUT=$WORK_DIR/trimAl_out

mkdir $TRIMAL_OUT

for aln in "$MAFFT_OUT"/*.aln.fa; do
    base=$(basename "$aln" .aln.fa)
    echo "Trimming $base.aln.fa with trimAl ..."
    # run trimAl
    trimal -in "$aln" -out "$TRIMAL_OUT/${base}.trim.fasta" -automated1
done

