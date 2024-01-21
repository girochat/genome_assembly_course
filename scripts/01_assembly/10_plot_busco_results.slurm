#!/usr/bin/env bash

# This script outputs visual representation of BUSCO results (version 4.1.4).
# Usage: sbatch 09_plot_busco_results.slurm <BUSCO summaries directory>

#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=00:30:00
#SBATCH --job-name=busco_plots
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_busco_plots_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_busco_plots_%j.e
#SBATCH --partition=pall

# Get output directory containing BUSCO results given in argument
BUSCO_SUMMARIES_DIR=$1

# Load Busco module
module load UHTS/Analysis/busco/4.1.4

# Generate plots and R script from BUSCO results
python3 scripts/misc/generate_plot_busco.py -wd ${BUSCO_SUMMARIES_DIR}
