#!/bin/bash
#SBATCH --job-name=busco_medaka.sh
#SBATCH -o busco_medaka.out
#SBATCH -e busco_medaka.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=16 #Note: you are always allocated an even number of cpus
#SBATCH --mem=32G
#SBATCH --time=5:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate busco

MEDAKA_OUT=/nfs/scratch/sanghu/johndory/chap2_ref_genome/04_polishing/flye/simplex_q7
OUT_DIR=$MEDAKA_OUT/busco

mkdir -p $OUT_DIR

echo "Run BUSCO"
cd $OUT_DIR

export _JAVA_OPTIONS="-Xmx20G"
busco -i $MEDAKA_OUT/consensus.fasta -o johndory -m genome -l actinopterygii_odb10 --cpu 16
