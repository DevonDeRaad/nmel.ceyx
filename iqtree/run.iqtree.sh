#!/bin/sh
#
#SBATCH --job-name=iqtree               # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=15               # 40 CPU allocation per Task
#SBATCH --partition=sixhour         # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/nmel.ceyx/iqtree  # Set working d$
#SBATCH --mem-per-cpu=2gb            # memory requested
#SBATCH --time=360

#run this bash code in a terminal window in the directory where you want the output to be, specifying the path to where you ran your optimized Stacks iteration to the -P flag
#(whitelist includes the loci you want to keep and popmap includes the samples you want to keep based on filtering)
#--phylip-var-all flag indicates to output the phylip including invariant sites (best for phylogenetic reconstruction)
/home/d669d153/work/stacks-2.41/populations -P /home/d669d153/work/nmel.ceyx/fastq -O . -M iqtree.popmap.txt --whitelist 2580.whitelist.txt --phylip-var-all

#annoyingly, Stacks adds a line at the end of the file that says something like '# Stacks v2.41;  Phylip interleaved; December 02, 2022'
#this is not standard for a phylip file, and will cause an error if you try to use this file to build a tree. Luckily, you can use the following sed one-liner below to easily remove this trailing line and write the cleaned output to a new file
sed '/^#/ d' populations.all.phylip > pops.phy

#-s specifies the input sequence data
#-m MFP specifies to perform model testing and use the best model of sequence evolution
#-bb specifies performing 1000 ultrafast bootstraps to assess support
#-nt AUTO allows the program to use the optimal number of threads (15 specified here)
/home/d669d153/work/iqtree-2.2.0-Linux/bin/iqtree2 -s pops.phy -m MFP -bb 1000 -nt AUTO
