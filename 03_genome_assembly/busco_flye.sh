#!/bin/bash
#SBATCH --job-name=busco_flye.sh
#SBATCH -o busco_flye.out
#SBATCH -e busco_flye.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=20 #Note: you are always allocated an even number of cpus
#SBATCH --mem=40G
#SBATCH --time=5:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate busco

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/simplex_duplex/h50/assembly.fasta
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/flye/simplex_duplex/h50/busco

mkdir -p $OUT_DIR

echo "Run BUSCO"
cd $OUT_DIR

export _JAVA_OPTIONS="-Xmx20G"
busco -i $ASM -o johndory -m genome -l actinopterygii_odb10 --cpu 20
