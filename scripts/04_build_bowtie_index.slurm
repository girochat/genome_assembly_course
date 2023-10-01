#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --time=01:00:00
#SBATCH --job-name=index_bowtie
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_bowtie_index_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_bowtie_index_%j.e
#SBATCH --partition=pall

# Load BowTie module
module add UHTS/Aligner/bowtie2/2.3.4.1

bowtie2-build $1 bowtie2_index
