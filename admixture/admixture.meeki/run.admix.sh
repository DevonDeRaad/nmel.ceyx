#!/bin/sh
#
#SBATCH --job-name=admixture.all              # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=5               # 40 CPU allocation per Task
#SBATCH --partition=sixhour            # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/nmel.ceyx/admixture.meeki     # Set working d$
#SBATCH --mem-per-cpu=1gb            # memory requested
#SBATCH --time=200

gunzip meeki.mac2.vcf.gz
#use plink to convert vcf directly to bed format:
/home/d669d153/work/plink --vcf /home/d669d153/work/nmel.ceyx/admixture.meeki/meeki.mac2.vcf  --double-id --allow-extra-chr --make-bed --out binary_fileset
#fix chromosome names
cut -f2- binary_fileset.bim  > temp
awk 'BEGIN{FS=OFS="\t"}{print value 1 OFS $0}' temp > binary_fileset.bim
rm temp

#run admixture for a K of 1-5, using cross-validation, with 5 threads
for K in {1..5}; 
do /home/d669d153/work/admixture_linux-1.3.0/admixture --cv -j5 -m EM binary_fileset.bed $K | tee log${K}.out;
done

#Which K iteration is optimal according to ADMIXTURE ?
grep -h CV log*.out > log.errors.txt

