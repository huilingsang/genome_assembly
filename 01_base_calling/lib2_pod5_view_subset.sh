#!/bin/bash
#SBATCH --job-name=lib2_pod5_view_subset.sh
#SBATCH -o lib2_pod5_view_subset.out
#SBATCH -e lib2_pod5_view_subset.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=20 #Note: you are always allocated an even number of cpus
#SBATCH --mem=40G
#SBATCH --time=10-00:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate Python_Env

POD5_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/pod5

pod5 subset $POD5_DIR/johndory_ref_lib2/ --summary $POD5_DIR/lib2_summary.tsv --columns channel --output $POD5_DIR/lib2_split_by_channel

conda deactivate
