#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --time=01:00:00
#SBATCH --job-name=default
#SBATCH --mail-user=giliane.rochat@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/grochat/genome_assembly_course/log/output_default_%j.o
#SBATCH --error=/data/users/grochat/genome_assembly_course/log/error_default_%j.e
#SBATCH --partition=pall
