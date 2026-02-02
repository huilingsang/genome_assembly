#!/bin/bash

#SBATCH --job-name=lib2_dorado_basecaller.sh
#SBATCH -o lib2_dorado_basecaller.out
#SBATCH -e lib2_dorado_basecaller.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=50 #Note: you are always allocated an even number of cpus
#SBATCH --mem=100G
#SBATCH --time=1-00:00:00

#export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:4096
export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:25

/nfs/home/sanghu/shl/software/dorado-0.9.0-linux-x64/bin/dorado basecaller --batchsize 1536 --device cuda:all /nfs/home/sanghu/shl/software/dorado-0.9.0-linux-x64/bin/dna_r10.4.1_e8.2_400bps_sup@v4.1.0 /nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/pod5/johndory_ref_lib2/ > /nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/basecaller/bam/lib2_dorado_basecaller.bam 
