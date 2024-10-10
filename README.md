Viral Genome Phylogenetic Analysis

Project Overview:  
This project analyzes the phylogenetic relationships between different SARS-CoV viral genomes. 
The program extracts genome sequences from GenBank, aligns them, calculates distance matrices, and visualizes a phylogenetic tree based on the relationships between the viral genomes.


During this project, we use several R libraries to facilitate the analysis of viral genomes and to create phylogenetic trees. The libraries provide functions for sequence alignment, distance matrix calculations, and data visualization.

Libraries Used:
- ape: For analysis of phylogenetics and evolution.
- seqinr: For reading and manipulating biological sequences.
- ggtree: For visualizing tree structures.
- BiocManager: For managing Bioconductor packages.
- DECIPHER: For sequence alignment and analysis.
- phangorn: For phylogenetic analysis and reconstruction.
- phytools: For various tools to analyze phylogenetic trees.
- Biostrings: For efficient handling of biological strings.

You can install any missing libraries using the following commands:
```R
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
install.packages("ape")
install.packages("DECIPHER")
install.packages("phangorn")
install.packages("phytools")
install.packages("geiger")
install.packages("RSQLite")
install.packages("ade4")
install.packages("seqinr")
install.packages("ggplot")
install.packages("viridis")
install.packages("ggtree")
