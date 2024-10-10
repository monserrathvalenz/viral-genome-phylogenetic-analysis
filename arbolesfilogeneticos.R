###Librerias 
library("ape")
library("seqinr")
library("ggtree")
library("BiocManager")
library("ggtree")
library("DECIPHER")
library("phangorn")
library("phytools")
library("Biostrings")


#Obtencion de genomas virales 
corona_virus <- c("OY288448", "OY975765", "OZ028138", "OY942125","OZ029935", "OZ028074", "OY856949", "OZ028772")

secuencias_virus <- read.GenBank(corona_virus) 
length(secuencias_virus)
class(secuencias_virus)
typeof(secuencias_virus)
str(secuencias_virus)

##Creamos un archivo 
write.dna(secuencias_virus, file = "coronavirus.fasta", format = "fasta")

###4 
seq_no_alineada <- readDNAStringSet("coronavirus.fasta", format = "fasta")
class(seq_no_alineada)
print(seq_no_alineada)


###5 Orienta los nucleótidos 
seq_no_alineada <- OrientNucleotides(seq_no_alineada)

###6 Alineamiento de secuencias 
seq_alineada <- AlignSeqs(seq_no_alineada)

BrowseSeqs(seq_alineada)

###7  Guardar el resultado con la función writeXStringSet de Biostrings
writeXStringSet(seq_alineada, file="coronavirus_seq_alineada.fasta")

###8  Carga el archivo .fasta con la función read.alignment de seqinr
virus_alineado <- read.alignment("coronavirus_seq_alineada.fasta", format = "fasta")

###9 Crear una matriz de distancia con la función dist.alignment de seqinr 
###  y obtén una tabla en escala de grises con la función table.paint del 
### paquete ape4 en donde sombras más oscuras de gris significan una mayor distancia.
matriz_distancia <- dist.alignment(virus_alineado, matrix = "similarity")
temp <- as.matrix(matriz_distancia)
dim(temp)
str(temp)
image(temp, col = gray((0:15)/15))
grid.text("Matriz", x = unit(0.5, "npc"), y = unit(1, "npc"), just = "center")

###10 Construye un objeto de tipo phylo con la función nj del paquete ape
### a partir de la matriz de distancia que obtuviste en el paso anterior.
virus_tree <- nj(matriz_distancia)
class(virus_tre)
virus_tree <- ladderize(virus_tree)
plot(virus_tree)

###11 Finalmente, construye un árbol filogenético utilizando el objeto de tipo
### phylo que construiste en el paso anterior y la función plot del código base de R.

ggtree(virus_tree, branch.length='none', layout='circular',) + geom_tiplab()
plot_virus_filogenia <- ggtree(virus_tree) + geom_tiplab() + ggtitle("Phylogenetic analysis of SARS-CoV genomes")
plot_virus_filogenia


