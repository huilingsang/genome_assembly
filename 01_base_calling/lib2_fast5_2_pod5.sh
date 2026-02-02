#!/bin/bash
#SBATCH --job-name=lib2_fast5_2_pod5.sh
#SBATCH -o lib2_fast5_2_pod5.out
#SBATCH -e lib2_fast5_2_pod5.err
#SBATCH --partition=parallel
#SBATCH --cpus-per-task=10 #Note: you are always allocated an even number of cpus
#SBATCH --mem=20G
#SBATCH --time=3-00:00:00

cp -f /mnt/genomics04/johndory/reference_genome/sequencing_data/fast5/johndory_ref_lib2/fast5_fail/*.fast5 /nfs/scratch/sanghu/johndory/chap2_ref_genome/sequencing_data/johndory_ref_lib2/fast5

cp /mnt/genomics04/johndory/reference_genome/sequencing_data/fast5/johndory_ref_lib2/fast5_pass/*.fast5 /nfs/scratch/sanghu/johndory/chap2_ref_genome/sequencing_data/johndory_ref_lib2/fast5

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate Python_Env

pod5 convert fast5 /nfs/scratch/sanghu/johndory/chap2_ref_genome/sequencing_data/johndory_ref_lib2/fast5/*.fast5 --output /nfs/scratch/sanghu/johndory/chap2_ref_genome/sequencing_data/fast5/johndory_ref_lib2/pod5/ --one-to-one /nfs/scratch/sanghu/johndory/chap2_ref_genome/sequencing_data/johndory_ref_lib2/fast5
