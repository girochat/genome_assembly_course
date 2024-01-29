# This script plots the percentages of genome occupied by TE superfamilies and clades. The difference between intact (vs) fragmented sequences is also represented.

# Import libraries
library(ape)
library(ggplot2)
library(gridExtra)
library(cowplot)
library(RColorBrewer)

# Go to annotation directory
setwd("/data/users/grochat/genome_assembly_course/")

# Retrieve TE annotation dataframe
genome_annotation <- load("data/TE/annotation/flye/TE_annotation_table.Rda") 

# 2 - Genome percentage occupied by clade/superfamily
##########################################################

# Function to calculate percentage of genome occupied by TE superfamily and clades
calculate_percentage_clade <- function(annotation, colnames){
  clade_percentages <- aggregate(annotation$length, by = list(annotation$clade), 
                                       FUN = sum, na.rm = T)
  clade_percentages$percentage <- round(clade_percentages$x / 119949456 * 100,
                                              digits=2)
  
  clade_percentages[nrow(clade_percentages) + 1, ] <- c("Total", sum(clade_percentages$x), 
                                                        sum(clade_percentages$percentage))
  colnames(clade_percentages) <- c("Clade", colnames)
  return(clade_percentages)
}

# Function to calculate percentage of genome occupied by intact (vs) fragmented sequences
calculate_intact_fragm_percentage <- function(annotation, colnames){
  annotation$count <- 1
  percentages <- aggregate(annotation$length, by = list(annotation$type), 
                           FUN = sum, na.rm = T)
  percentages$percentage <- round(percentages$x / 119949456 * 100,
                                             digits=2)
  count <- aggregate(annotation$count, by = list(annotation$type), 
                                 FUN = sum, na.rm = T)
  percentages <- merge(percentages, count, by = "Group.1")
  percentages[nrow(percentages) + 1, ] <- c("Total", sum(percentages$x.x), 
                                            sum(percentages$percentage), 
                                            sum(percentages$x.y))
  colnames(percentages) <- c("Type", colnames)
  return(percentages)
}

# Get Copia clades percentages
copia_clade_percentages <- calculate_percentage_clade(genome_annotation[genome_annotation$superfamily == "Copia", ],
                                                      c("Bp.all", "percentage.all"))

# Get Gypsy clades percentages
gypsy_clade_percentages <- calculate_percentage_clade(genome_annotation[genome_annotation$superfamily == "Gypsy", ],
                                                      c("Bp.all", "percentage.all"))

# Get number of copia/gypsy sequences found by TESorter but not in EDTA library
nb_missing_copia_clades <- sum(genome_annotation$length[genome_annotation$superfamily == "Copia"] == 0)
nb_missing_gypsy_clades <- sum(genome_annotation$length[genome_annotation$superfamily == "Gypsy"] == 0)

genome_annotation$name[genome_annotation$length == 0]
 
# Get percentages of intact and fragmented TE in whole assembly for all groups
all_percentages <- calculate_intact_fragm_percentage(genome_annotation[genome_annotation$type != 0, ],
                                                              c("Bp.all", "percentage.all", "count.all"))
intact_percentages <- calculate_intact_fragm_percentage(genome_annotation[genome_annotation$type != 0 &
                                                                            genome_annotation$method == "structural", ],
                                                        c("Bp.intact", "percentage.intact", "count.intact"))
fragm_percentages <- calculate_intact_fragm_percentage(genome_annotation[genome_annotation$type != 0 &
                                                                           genome_annotation$method == "homology", ],
                                                       c("Bp.fragm", "percentage.fragm", "count.fragm"))
TE_percentages <- merge(all_percentages, fragm_percentages, by = "Type", all=T)
TE_percentages <- merge(TE_percentages, intact_percentages, by = "Type", all=T)

# Plot the number of intact (vs) fragmented TEs per superfamily
ggplot(genome_annotation[genome_annotation$method != 0 &
                           genome_annotation$type != "repeat_region" &
                           genome_annotation$type != "long_terminal_repeat" &
                           genome_annotation$type != "target_site_duplication", ], 
       mapping = aes(x = type, fill = method)) + 
  geom_bar() +
  theme_classic() +
  theme(axis.text.y = element_blank(), axis.ticks.y= element_blank(), 
        axis.line.y = element_blank()) + 
  labs(x="Superfamily", y="Count", title="") + 
  scale_x_discrete(labels=c("CACTA/TIR", "Copia/LTR", "Gypsy/LTR", "hAT/TIR", 
                            "Helitron", "LTR", "Mutator/TIR", "PIF_Harbinger/TIR", 
                            "Tc1_Mariner/TIR"))

