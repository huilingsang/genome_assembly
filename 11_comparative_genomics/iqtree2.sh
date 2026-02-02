#!/bin/bash
#SBATCH --job-name=iqtree2.sh
#SBATCH -o iqtree2.out
#SBATCH -e iqtree2.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=32 #Note: you are always allocated an even number of cpus
#SBATCH --mem=100G
#SBATCH --time=3-00:00:00

module load seqkit/0.13.2
IQTREE2=/nfs/home/sanghu/shl/software/iqtree-2.4.0-Linux-intel/bin/iqtree2

INPUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteins_newest2/primary_transcripts/OrthoFinder_simple/rename_header_after_trim

find $INPUT_DIR/*.trim.fasta -print > $INPUT_DIR/list_trimed_rname_files

IQTREE2_OUT=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/proteins_newest2/primary_transcripts/OrthoFinder_simple/iqtree2_out
mkdir $IQTREE2_OUT
cd $IQTREE2_OUT

seqkit concat --infile-list $INPUT_DIR/list_trimed_rname_files > $IQTREE2_OUT/supermatrix.fa

$IQTREE2 -s $IQTREE2_OUT/supermatrix.fa -m MFP -B 1000 -T AUTO --prefix iqtree2_species_tree

