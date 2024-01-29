# Genome assembly and annotation

## Description of the project
This repository contains all the scripts and data that were used for the project of building a _de novo_ assembly of the Shadhara accession (Sha) of _Arabidopsis thaliana_. The resulting Sha assembly and those of four other accessions (An-1, C24, Cvi-0 and Ler-3) were used for a comparative analysis of the corresponding gene and TE annotation. It is part of a collaborative work with four other teams, each working on a respective _de novo_ assembly.  
This project was part of two courses, "Genome and transcriptome assembly" and "Organisation and annotation of eukaryote genomes" organised by the University of Bern and Fribourg respectively in the context of the Master of Bioinformatics.

## Workflow of the project

### Assembly part

* Quality control and kmer analysis with FASTQC and jellyfish
* Long-read _de novo_ assembly with Canu and Flye for the genomic data, and with Trinity for the transcriptomic data
* Assembly polishing with Pilon after short-read mapping with BowTie2
* Assembly evaluation with Busco, QUAST and Merqury
* Dot plot between the _de novo_ assemblies and reference genome with MUMmer
  
### Annotation part

* TE annotation and classification with EDTA and TESorter
* TE dynamics analysis: TE insertion dating, TE genomic distribution plotting and TE clades phylogeny
* Gene annotation with MAKER
* Gene annotation evaluation with Busco (protein-level) and alignment to Uniprot protein sequences with blast. 
* Genetic comparative analysis between accessions with GENESPACE

## Repository organisation
The repository is organised into three main directories:
- scripts directory: all scripts that were used throughout the workflow of the project
- data directory: all the data of the project, from raw reads to intermediate data produced during the steps of the project
- analysis directory: all the results from any analysis that was performed
  
More information can be found in the README section of each directory.
