#!/bin/bash
#SBATCH --job-name=FCS_screen.sh
#SBATCH -o FCS_screen.out
#SBATCH -e FCS_screen.err
#SBATCH --partition=bigmem
#SBATCH --cpus-per-task=48 #Note: you are always allocated an even number of cpus
#SBATCH --mem=500G
#SBATCH --time=10-00:00:00

module load GCC/10.2.0
module load OpenMPI/4.0.5
module load Singularity/3.10.2
module load GCCcore/13.3.0
module load Python/3.12.3

#Assign the path to the --gx-db folder to GXDB_LOC
GXDB_LOC=/nfs/scratch/sanghu/johndory/chap2_ref_genome/decontam_FCS/FCS/db_folder

GENOME=/nfs/scratch/sanghu/johndory/chap2_ref_genome/09_gap_filling/tgsgapcloser_out/filter_low_reads/filtered_scaffolds_final.fasta
OUT_DIR=/nfs/scratch/sanghu/johndory/chap2_ref_genome/decontam_FCS/fcs_results

python3 /nfs/scratch/sanghu/johndory/chap2_ref_genome/decontam_FCS/FCS/fcs.py --image /nfs/scratch/sanghu/johndory/chap2_ref_genome/decontam_FCS/FCS/fcs-gx.sif screen genome --fasta $GENOME --out-dir $OUT_DIR/hifiasm_simplex_q8 --gx-db "$GXDB_LOC" --tax-id 64108
