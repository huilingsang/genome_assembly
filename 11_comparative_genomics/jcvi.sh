#!/bin/bash
#SBATCH --job-name=jcvi.sh
#SBATCH -o jcvi.out
#SBATCH -e jcvi.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=12 #Note: you are always allocated an even number of cpus
#SBATCH --mem=24G
#SBATCH --time=3-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate jcvi

NZ_GFF=/nfs/scratch/sanghu/johndory/chap2_ref_genome/12_genome_annotation/braker_out/nz_johndory/filtered_q20_final/braker.gff3
UK_GFF=/nfs/scratch/sanghu/johndory/chap2_ref_genome/12_genome_annotation/braker_out/uk_ref/braker.gff3
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/13_comparative_genomics/jcvi
 
cd $OUT_DIR

#python -m jcvi.formats.gff bed --type=mRNA --key=ID $NZ_GFF -o NZ.bed
#python -m jcvi.formats.gff bed --type=mRNA --key=ID $UK_GFF -o UK.bed

#module load ncbi/blast+/2.6.0
NZ_PROTEIN=/nfs/scratch/sanghu/johndory/chap2_ref_genome/12_genome_annotation/braker_out/nz_johndory/filtered_q20_final/braker.codingseq
UK_PROTEIN=/nfs/scratch/sanghu/johndory/chap2_ref_genome/12_genome_annotation/braker_out/uk_ref/braker.codingseq

#python -m jcvi.formats.fasta format $NZ_PROTEIN NZ.cds
#python -m jcvi.formats.fasta format $UK_PROTEIN UK.cds

module load last/953

#python -m jcvi.compara.catalog ortholog NZ UK --no_strip_names

#python -m jcvi.compara.blastfilter NZ.UK.last --no_strip_names

#python -m jcvi.compara.synteny screen --minspan=10 --simple NZ.UK.lifted.anchors NZ.UK.anchors.simple

#python -m jcvi.graphics.synteny layout --patterns=rainbow --font=Arial

python -m jcvi.graphics.karyotype seqids layout

