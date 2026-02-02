#!/bin/bash
#SBATCH --job-name=02_cov_purge.sh
#SBATCH -o 02_cov_purge.out
#SBATCH -e 02_cov_purge.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=32 #Note: you are always allocated an even number of cpus
#SBATCH --mem=64G
#SBATCH --time=05:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate purge_haplotigs

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/05_exclude_mito/medaka_nuclear.fa
BAM_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/06_purge/hifiasm_simplex_q8
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/06_purge/hifiasm_simplex_q8/l20_m60_h200

cd $OUT_DIR
purge_haplotigs cov -i $BAM_DIR/hifiasm_simplex_q8_medaka_nuclear.bam.200.gencov -l 20 -m 60 -h 200 [-o coverage_stats.csv -j 80  -s 80 ]

purge_haplotigs purge -g $ASM -c $OUT_DIR/coverage_stats.csv -d -b $BAM_DIR/hifiasm_simplex_q8_medaka_nuclear.bam -t 32 -o $OUT_DIR/hifiasm_simplex_q8_medaka_nuclear_purge

