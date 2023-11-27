#!/bin/sh
#
#SBATCH --job-name=process.radtags            # Job Name
#SBATCH --nodes=1              # 40 nodes
#SBATCH --ntasks-per-node=1             # 40 CPU allocation per Task
#SBATCH --partition=bi            # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/scratch/ceyx      # Set working d$
#SBATCH --mem-per-cpu=5gb            # memory requested
#SBATCH --time=5000

#demultiplex all samples library prepped on plate 2, using the barcodes found in the text file 'plate.2.barcodes.txt'
/home/d669d153/work/stacks-2.3b/process_radtags -p /home/d669d153/scratch/ceyx/plate2 -o /home/d669d153/scratch/ceyx/fastq -b plate.2.barcodes.txt -e ndeI -r -c -q