#!/bin/sh
#
#SBATCH --job-name=snapp               # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=25               # 40 CPU allocation per Task
#SBATCH --partition=bi            # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/nmel.ceyx/snapp    # Set working d$
#SBATCH --mem-per-cpu=800            # memory requested
#SBATCH --array=1-3
#SBATCH --time=10000

#run beast 2.7.1
/home/d669d153/work/beast.2.7.1/beast/bin/beast -threads 25 rep$SLURM_ARRAY_TASK_ID.xml

