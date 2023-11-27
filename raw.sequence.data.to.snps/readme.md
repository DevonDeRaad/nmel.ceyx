# 

## Steps:
-I used the scripts 'demultiplex.plate.1.sh' and 'demultiplex.plate.2.sh' to demultiplex the pooled reads into individual fastq files with the 'fq.gz' extension for each sample.
-I then used the script 'map.and.run.stacks.sh' to map each individual sample against the publicly available *Ceyx cyanopectus* reference genome [available here](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_013401355.1/), and call SNPs using [Stacks](https://catchenlab.life.illinois.edu/stacks/).
-From there, I copied the output vcf file containing unfiltered SNPs to my local machine to work on in RStudio, file available [here](). The pipeline picks up from here with [SNP filtering]().
