#!/bin/bash
#SBATCH --job-name=busco_purged.sh
#SBATCH -o busco_purged.out
#SBATCH -e busco_purged.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=16 #Note: you are always allocated an even number of cpus
#SBATCH --mem=32G
#SBATCH --time=5:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate busco

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/06_purge/hifiasm_simplex_q8/l20_m60_h200/hifiasm_simplex_q8_medaka_nuclear_purge.fasta
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/06_purge/hifiasm_simplex_q8/l20_m60_h200/busco

mkdir -p $OUT_DIR

echo "Run BUSCO"
cd $OUT_DIR

export _JAVA_OPTIONS="-Xmx20G"
busco -i $ASM -o johndory -m genome -l actinopterygii_odb10 --cpu 16 -f
