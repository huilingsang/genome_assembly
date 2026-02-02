#!/bin/bash
#SBATCH --job-name=lib1_dorado_basecaller.sh
#SBATCH -o lib1_dorado_basecaller.out
#SBATCH -e lib1_dorado_basecaller.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=60 #Note: you are always allocated an even number of cpus
#SBATCH --mem=120G
#SBATCH --time=1-00:00:00

export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:4096

/nfs/home/sanghu/shl/software/dorado-0.9.0-linux-x64/bin/dorado basecaller --batchsize 1536 --device cuda:all /nfs/home/sanghu/shl/software/dorado-0.9.0-linux-x64/bin/dna_r10.4.1_e8.2_400bps_sup@v4.1.0 /nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/pod5/johndory_ref_lib1/ > /nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/basecaller/bam/lib1_dorado_basecaller.bam

