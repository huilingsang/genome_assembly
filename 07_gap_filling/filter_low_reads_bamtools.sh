#!/bin/bash
#SBATCH --job-name=filter_low_reads_bamtools.sh
#SBATCH -o filter_low_reads_bamtools.out
#SBATCH -e filter_low_reads_bamtools.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=20 #Note: you are always allocated an even number of cpus
#SBATCH --mem=40G
#SBATCH --time=2-00:00:00

module load minimap2/2.16
module load samtools/1.10
module load bamtools/2.5.1

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/09_gap_filling/tgsgapcloser_out/gapclose.scaff_seqs
FASTQ=/mnt/genomics10/chap2_ref_genome/02_reads_filter/duplex_called/fastq/simplex.porechop.nextflow.chopper_q8.fastq.gz
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/09_gap_filling/tgsgapcloser_out/filter_low_reads

cd $OUT_DIR

#minimap2 -ax map-ont -t 20 $ASM $FASTQ | samtools sort -@4 -o $OUT_DIR/reads_map.bam
#samtools index $OUT_DIR/reads_map.bam

# only retain primary alignments with a map quality >20
bamtools filter -mapQuality '>=20' -isPrimaryAlignment 'true' -in reads_map.bam -out $OUT_DIR/reads_mq20.primaryaln.bam
samtools index reads_mq20.primaryaln.bam

samtools coverage reads_mq20.primaryaln.bam > bamtools_contig_coverage_q20.tsv

