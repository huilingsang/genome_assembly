#!/bin/bash
#SBATCH --job-name=tgsgapcloser.sh
#SBATCH -o tgsgapcloser.out
#SBATCH -e tgsgapcloser.err
#SBATCH --partition=bigmem
#SBATCH --cpus-per-task=20 #Note: you are always allocated an even number of cpus
#SBATCH --mem=256G
#SBATCH --time=6-00:00:00

module load seqkit/0.13.2
#module load minimap2/2.16

export PATH=/nfs/home/sanghu/shl/software/TGS-GapCloser/minimap2:$PATH

tgsgapcloser=/nfs/home/sanghu/shl/software/TGS-GapCloser/tgsgapcloser
ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/08_ragtag_nuclear/l20_m60_h200/ragtag.scaffold.fasta
FASTQ=/mnt/genomics10/chap2_ref_genome/02_reads_filter/duplex_called/fastq/simplex.porechop.nextflow.chopper_q8.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/gap_filling/tgsgapcloser_out

cd $OUT_DIR
#seqkit fq2fa $FASTQ > ont.fasta

$tgsgapcloser --scaff $ASM --reads ont.fasta --output gapclose --ne --tgstype ont --thread 4
