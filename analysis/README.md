# Analysis Directory
This directory contains all results of the various analyses that were performed at each step of the workflow. Here is a brief description of each subdirectory:

* QC:  
  Jellyfish and FASTQC results that were obtained using all raw reads; i.e. the Illumina paired-end genomic and transcriptomic data as well as Pacbio CLR genomic data.
* TE:  
  Results of the TE dynamics and annotation analyses. In particular, it contains the TE annotation summary files for all accessions and all plots relative to TE dynamics; i.e. Copia/Gypsy clades phylogenetic trees, the genomic distribution plots and the TE insertion age plot. 
* alignment:  
  Alignment rate of the Illumina short-read data to each assembly.
* assembly:  
  All files output by each assembler (Trinity, Flye and Canu). Each assembly FASTA file can be found in the corresponding subdirectory of the data directory.
* evaluation:  
  Results of Merqury, QUAST and Busco evaluations. 
* genespace:  
  GENESPACE output directory. It contains many subdirectories specific to the GENESPACE analysis. The bed and peptide subdirectory contains the input data necessary for running GENESPACE. The riparian and dotplot subdirectories contain syntenic plots comparing all accessions together (for the first one) or each pair of accessions (for the second one). The orthofinder subdirectory contains the results concerning gene orthogroups.
* genome comparison:  
  Dot plots of the assembly part. It compares the alignment between each _de novo_ assembly and _A. thaliana _reference  genome.
* blastp:  
  Blast alignment output between Uniprot protein sequences and MAKER protein sequences (obtained with both Canu and Flye assembly)

