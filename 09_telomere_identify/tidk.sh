#!/bin/bash
#SBATCH --job-name=tidk.sh
#SBATCH -o tidk.out
#SBATCH -e tidk.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=24 #Note: you are always allocated an even number of cpus
#SBATCH --mem=48G
#SBATCH --time=5:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate tidk

ASM=/nfs/scratch/sanghu/johndory/chap2_ref_genome/10_telomere_identify/l20_m60_h200_nuclear/chromosomes_22.fa
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/10_telomere_identify/l20_m60_h200_nuclear/tidk_out

#mkdir -p $OUT_DIR

cd $OUT_DIR

tidk search --string TTAGGG -w 10000 --output search_TTAGGG_w10000 --dir $OUT_DIR $ASM 
tidk plot --tsv $OUT_DIR/search_TTAGGG_w25000_telomeric_repeat_windows.tsv
