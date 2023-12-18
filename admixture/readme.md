# Details for each of the *ADMIXTURE* iterations run in this paper

## I began by running *ADMIXTURE* on all 100 ingroup samples in the filtered dataset using all unlinked SNPs with MAC > 0.
- The input and output files from this run are located in the folder [admixture.all](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/admixture/admixture.all).
- The step by step details for this run can be found in the file [all.samps.admixture.html](https://devonderaad.github.io/nmel.ceyx/admixture/all.samps.admixture.html).

## I then repeated this same *ADMIXTURE* run while removing all singleton (i.e., MAC = 1) SNPs
- The input and output files from this run are located in the folder [admixture.all.nosingletons](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/admixture/admixture.all.nosingletons).
- The step by step details for this run can be found in the file [all.samps.admixture.html](https://devonderaad.github.io/nmel.ceyx/admixture/all.samps.admixture.html).

## I then did separate *ADMIXTURE* runs for each of the species that appeared to have genetic substructure.
- For *C. solitarius*, all input and output files for its unique *ADMIXTURE* run are present in the folder [admixture.sol](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/admixture/admixture.sol).


- For *C. meeki*, all input and output files for its unique *ADMIXTURE* run are present in the folder [admixture.meeki](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/admixture/admixture.meeki).


- And for *C. collectoris*, all input and output files for its unique *ADMIXTURE* run are present in the folder [admixture.coll](https://github.com/DevonDeRaad/nmel.ceyx/tree/main/admixture/admixture.coll).


- And the step by step process of running each of these subset iterations can be viewed in the file [admxiture.subsets.html](https://devonderaad.github.io/nmel.ceyx/admixture/admixture.subsets.html).
