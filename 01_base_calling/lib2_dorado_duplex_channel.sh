#!/bin/bash

#SBATCH --job-name=lib2_dorado_duplex_channel.sh
#SBATCH -o lib2_dorado_duplex_channel.out
#SBATCH -e lib2_dorado_duplex_channel.err
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=100 #Note: you are always allocated an even number of cpus
#SBATCH --mem=200G
#SBATCH --time=1-00:00:00

export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:4096

POD5_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/pod5
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/01_base_calling/duplex_calling/bam

/nfs/home/sanghu/shl/software/dorado-0.9.0-linux-x64/bin/dorado duplex --batchsize 1536 --device cuda:all /nfs/home/sanghu/shl/software/dorado-0.9.0-linux-x64/bin/dna_r10.4.1_e8.2_400bps_sup@v4.1.0 $POD5_DIR/lib2_split_by_channel/ > $OUT_DIR/lib2_duplex_channel.bam 
