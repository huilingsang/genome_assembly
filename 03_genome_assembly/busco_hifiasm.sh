#!/bin/bash
#SBATCH --job-name=busco_hifiasm.sh
#SBATCH -o busco_hifiasm.out
#SBATCH -e busco_hifiasm.err
#SBATCH --partition=quicktest
#SBATCH --cpus-per-task=20 #Note: you are always allocated an even number of cpus
#SBATCH --mem=40G
#SBATCH --time=5:00:00

eval "$(conda shell.bash hook)" # basically inits your conda - prevents errors like: CommandNotFoundError: Your shell has not been properly configured ...

conda activate busco

hifiasm_dir=/nfs/scratch/sanghu/johndory/chap2_ref_genome/03_genome_assembly/hifiasm/simplex/q7_h50_t50
out_dir=$hifiasm_dir/busco

mkdir -p $out_dir

echo "Run BUSCO"
cd $out_dir

#get fasta
awk '/^S/{print ">"$2;print $3}' $hifiasm_dir/simplex_q7_h50_t50.hifiasm.bp.p_ctg.gfa > simplex_q7_h50_t50.hifiasm.fa
assembly=simplex_q7_h50_t50.hifiasm.fa

export _JAVA_OPTIONS="-Xmx20G"
busco -i $assembly -o johndory -m genome -l actinopterygii_odb10 --cpu 20
