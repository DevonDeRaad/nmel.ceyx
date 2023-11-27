#!/bin/sh
#
#SBATCH --job-name=map.ceyx           # Job Name
#SBATCH --nodes=1             # nodes
#SBATCH --cpus-per-task=20               # CPU allocation per Task
#SBATCH --partition=bi            # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/nmel.ceyx # Set working d$
#SBATCH --mem-per-cpu=1gb            # memory requested
#SBATCH --time=10000

#create a single variable that contains the name of each sample
files="C_solitarius_4829
C_solitarius_4846
C_solitarius_4847
C_sacerdotis_5307
C_sacerdotis_5311
C_sacerdotis_5317
C_solitarius_5447-8
C_solitarius_5565
C_solitarius_6836
C_solitarius_6948
C_solitarius_6962
C_solitarius_7161
C_solitarius_7256
C_solitarius_7604
C_solitarius_7629
C_solitarius_9547
C_solitarius_9572
C_solitarius_9619
C_solitarius_9628
C_solitarius_12865
C_nigromaxilla_15891
C_nigromaxilla_15907
C_nigromaxilla_15908
C_solitarius_16175
C_margarethae_27239
C_margarethae_27245
C_margarethae_27254
C_margarethae_27261
C_margarethae_27264
C_sacerdotis_27646
C_mulcatus_27674
C_mulcatus_27686
C_mulcatus_27698
C_mulcatus_27746
C_mulcatus_27759
C_mulcatus_27839
C_mulcatus_27842
C_mulcatus_27852
C_solitarius_27884
C_sacerdotis_29529
C_meeki_32006
C_meeki_32007
C_meeki_32014
C_meeki_32022
C_meeki_32023
C_meeki_32024
C_meeki_32038
C_meeki_32054
C_meeki_32075
C_malaitae_32740
C_malaitae_32770
C_malaitae_32790
C_nigromaxilla_32835
C_nigromaxilla_32846
C_nigromaxilla_32860
C_collectoris_33756
C_collectoris_33757
C_collectoris_33759
C_collectoris_33760
C_collectoris_33789
C_collectoris_33790
C_collectoris_33819
C_collectoris_33822
C_collectoris_33832
C_collectoris_33842
C_collectoris_33871
C_collectoris_33905
C_collectoris_33906
C_meeki_34840
C_meeki_34848
C_meeki_34855
C_meeki_34862
C_meeki_34865
C_meeki_34870
C_meeki_34885
C_meeki_5633-2
C_meeki_32075-2
C_meeki_32075-3
C_gentianus_34926
C_gentianus_34953
C_gentianus_34957
C_gentianus_34969
C_gentianus_35042
C_collectoris_36072
C_collectoris_36076
C_collectoris_36094
C_collectoris_36095
C_collectoris_36096
C_collectoris_36101
C_collectoris_36105
C_collectoris_36112
C_collectoris_36129
C_collectoris_36144
C_collectoris_36145
C_collectoris_36156
C_collectoris_36160
C_collectoris_36212
C_collectoris_36217
C_collectoris_36240
C_meeki_34887
C_collectoris_36249
C_meeki_5633
C_dispar_5611
C_solitarius_5157
C_solitarius_5192
C_solitarius_6977
C_solitarius_6982
C_solitarius_7229
C_solitarius_7295
C_solitarius_7526
C_solitarius_7641
C_solitarius_9539
C_solitarius_9542
C_gentianus_13530
C_gentianus_13540
C_margarethae_14484
C_nigromaxilla_15880
C_nigromaxilla_15892
C_margarethae_19259
C_collectoris_33266
C_collectoris_33272
C_collectoris_33274
C_collectoris_33761
C_collectoris_33797
C_collectoris_33863
C_collectoris_33878
C_collectoris_33908
C_collectoris_33922
C_collectoris_36115
C_collectoris_36133
C_dispar_5611-2
C_malaitae_32740-2
C_malaitae_32790-2
C_collectoris_33272-2
C_collectoris_33274-2"

#This code will map our RAD reads to a reference genome and call SNPs, with each step parallelized across 20 CPU's.
#I executed this code on the KU High Performance Computing Cluster (HPCC) and the whole script ran without error in ~3 hours.
#I then copied the output vcf to my local machine and did preliminary analyses and filtering in RStudio

#index reference genome for 'Ceyx cyanopectus', which is publicly available as part of B10K (https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_013401355.1/)
/panfs/pfs.local/work/bi/bin/bwa/bwa index ceyx.b10k.fna

#Align single-end RAD reads to the Ceyx cyanopectus reference genome using BWA,
#convert to BAM and SORT, using samtools.
for sample in $files
do 
    /panfs/pfs.local/work/bi/bin/bwa/bwa mem -t 20 ceyx.b10k.fna fastq/${sample}.fq.gz |
      /panfs/pfs.local/work/bi/bin/samtools-1.3.1/bin/samtools view -b |
      /panfs/pfs.local/work/bi/bin/samtools-1.3.1/bin/samtools sort > fastq/${sample}.bam
done

#Run gstacks to build loci from the genome-wide bam alignments.
#file 'ceyx.popmap.txt' is a plain text file with two columns (separated by a single tab), one containing the name of each sample, and the other containing a population assignment
/home/d669d153/work/stacks-2.41/gstacks -I ./fastq -M ceyx.popmap.txt -O ./fastq -t 20

#Run populations and export a vcf. Do filtering steps on the output vcf in R.
/home/d669d153/work/stacks-2.41/populations -P ./fastq -M ceyx.popmap.txt -O . --vcf -t 20