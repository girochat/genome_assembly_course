# This script plots the genomic distribution of all TE superfamilies on chromosome 2 as well as the Gypsy and Copia clades distribution on the same chromosome.
# Chromosome 2 was found to contain the longest scaffold of the assembly.

# Import libraries
library(ape)
library(ggplot2)
library(gridExtra)
library(cowplot)
library(RColorBrewer)

# Go to annotation directory
setwd("/data/users/grochat/genome_assembly_course/")

# 1 - Prepare TE annotation dataframe with data corresponding to TEs on chrom. 2 (contains biggest scaffold)
#-----------------------------------------------------------------------------------------------------------

# Import whole genome TE annotation of Sha assembly and add length of sequences (modified .gff3)
genome_annotation <- read.delim("data/TE/annotation/flye/Sha_flye_polished.fasta.mod.EDTA.TEanno.tsv", header = T)
genome_annotation$length <- genome_annotation$end - genome_annotation$start

# Import copia and gypsy clade libraries (modified .tsv)
copia_file <- "data/TE/classification/flye/copia_library.fasta.rexdb-plant.cls_modif.tsv"
gypsy_file <- "data/TE/classification/flye/gypsy_library.fasta.rexdb-plant.cls_modif.tsv"
copia_library <- read.delim(copia_file, header = T)
gypsy_library <- read.delim(gypsy_file, header = T)
copia_gypsy_library <- rbind(copia_library, gypsy_library)

# Modify genome annotation to have copia and gypsy clades from TESorter output
temp <- merge(genome_annotation, copia_gypsy_library, by = "name", all=T)
genome_annotation <- temp
rm("temp")
genome_annotation[is.na(genome_annotation)] <- 0 

# Determine longest scaffold in Sha assembly
contig_lengths <- read.delim("analysis/assembly/flye/flye_contigs_length.tsv", header = F)
max_length <- max(contig_lengths$V2)
max_contig <- contig_lengths$V1[contig_lengths$V2 == max_length]

# Set all major contigs that form chromsome 2 (=chrom. containing max contig)
chr2_contigs <- c("scaffold_18_pil", "contig_8_pilon", "contig_10_pilon") 

# Get TE annotation for chromosome 2 only
TE_longest_scaffold <- genome_annotation[genome_annotation$seqid %in% chr2_contigs,]

# Add center location of each sequence to df
TE_longest_scaffold$center <- TE_longest_scaffold$start + 
  as.integer((TE_longest_scaffold$end - TE_longest_scaffold$start)/2)

# Correct TE position based on sequence of contigs in chrom 3
length <- 0
for (contig in chr2_contigs){
  print(contig)
  TE_longest_scaffold$center[TE_longest_scaffold$seqid == contig] <- 
    TE_longest_scaffold$center[TE_longest_scaffold$seqid == contig] + length
  length <- length + contig_lengths$V2[contig_lengths$V1 == contig]
}

# Save whole-genome TE annotation customised table
save(genome_annotation, file="data/TE/annotation/flye/TE_annotation_table.Rda")

# 2 - Plot genomic distribution of TE for all TE, Copia's clades and Gypsy's
#------------------------------------------------------------------------

# Function to plot TE genomic distribution
plot_genomic_distrib <- function(df, title="", bins=20, colour=""){
  if (colour != ""){
    g <- ggplot(data = df, aes(x = center)) + geom_histogram(bins=bins, fill=colour, 
                                                             colour = "black")
  }else{
    g <- ggplot(data = df, aes(x = center, colour = type)) + geom_histogram(bins=bins)
  }
  plot_distrib <- g +
    theme_classic() +
    theme(axis.text.y = element_blank(), axis.ticks.y= element_blank(), 
          axis.line.y = element_blank()) + 
    labs(x="Chromosome 2 (Mbp)", y="", title=title) + 
    scale_x_continuous(breaks = c(0, 5*10^6, 10*10^6, 15*10^6, 20*10^6), 
                       labels=c("20", "15", "10", "5", "0"), limits = c(0, 20*10^6))
  return(plot_distrib)
}

# Select only superfamilies from annotation for plotting
superfamilies <- unique(TE_longest_scaffold$type)[-c(4, 5, 6)]

# Plot all superfamilies
genomic_distrib_all <- plot_genomic_distrib(TE_longest_scaffold[
  TE_longest_scaffold$type %in% superfamilies, c(4, 20)],
  title="TE superfamilies genomic distribution")

png("analysis/TE/dynamics/genomic_distribution_all.png")
show(genomic_distrib_all)
dev.off()

# Plot only Copia clades
copia_clades <- unique(TE_longest_scaffold$clade[TE_longest_scaffold$superfamily == "Copia"])
i <- 1
plots <- list()
titles <- list()

colours <- brewer.pal(7,'RdYlBu')
for (clade in copia_clades){
  if (nrow(TE_longest_scaffold[TE_longest_scaffold$clade == clade &
                               TE_longest_scaffold$superfamily != 0 ,]) > 1){
    plots[[i]] <- plot_genomic_distrib(TE_longest_scaffold[TE_longest_scaffold$clade == clade, 
                                                           c(4, 17, 20)], colour=colours[i])
    titles[[i]] <- clade
    i <- i+1
    
  }
  nb_rows <- ceiling(length(plots))
  copia_clade_distribution <- plot_grid(plotlist=plots, labels=titles, nrow=nb_rows, ncol=1)
}
png("analysis/TE/dynamics/copia_clade_distribution.png")
show(copia_clade_distribution)
dev.off()

# Plot only gypsy clades
gypsy_clades <- unique(TE_longest_scaffold$clade[TE_longest_scaffold$superfamily == "Gypsy"])
i <- 1
plots <- list()
titles <- list()
colours <- brewer.pal(5,'RdYlBu')
for (clade in gypsy_clades){
  if (nrow(TE_longest_scaffold[TE_longest_scaffold$clade == clade &
                               TE_longest_scaffold$superfamily != 0 ,]) > 1){
    plots[[i]] <- plot_genomic_distrib(TE_longest_scaffold[TE_longest_scaffold$clade == clade, 
                                                           c(4, 17, 20)], colour=colours[i])
    titles[[i]] <- clade
    i <- i +1
    
  }
  nb_rows <- ceiling(length(plots)/2)
  gypsy_clade_distribution <- plot_grid(plotlist=plots, labels=titles, nrow=nb_rows, ncol=2)
}
png("analysis/TE/dynamics/gypsy_clade_distribution.png")
show(gypsy_clade_distribution)
dev.off()

