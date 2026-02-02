#!/bin/bash
#SBATCH --job-name=conver2phy.sh
#SBATCH -o conver2phy.out
#SBATCH -e conver2phy.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=32 #Note: you are always allocated an even number of cpus
#SBATCH --mem=100G
#SBATCH --time=3-00:00:00


AMAS=/nfs/home/sanghu/shl/software/AMAS-master/amas/AMAS.py
WORK_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteins_newest2/primary_transcripts/OrthoFinder_simple
OUT_DIR=$WORK_DIR/mcmctree

cd $OUT_DIR
python3 $AMAS concat -i $WORK_DIR/iqtree2_out/supermatrix.fa  -f fasta -d aa -u phylip


