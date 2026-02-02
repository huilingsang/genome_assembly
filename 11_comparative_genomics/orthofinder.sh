#!/bin/bash
#SBATCH --job-name=orthofinder_simple.sh
#SBATCH -o orthofinder_simple.out
#SBATCH -e orthofinder_simple.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=120 #Note: you are always allocated an even number of cpus
#SBATCH --mem=240G
#SBATCH --time=3-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate orthofinder

#WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteomes
#WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteomes_nine
#WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteomes_nine_primary
#WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteomes_nine
WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteins_newest2

#extract just the longest transcript variant per gene
#for f in $WORK_DIR/*.faa; do python /nfs/home/sanghu/.conda/envs/orthofinder/bin/primary_transcript.py $f; done

orthofinder -f $WORK_DIR/primary_transcripts -t 120 -a 120 
