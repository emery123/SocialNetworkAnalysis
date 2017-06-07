library(igraph)
library(ggplot2)
install.packages("Matrix")
library(Matrix)
library(network)


networrk <- read.csv( "pearlz.csv", header = T, sep = ",") #reading the csv file which represents the matrix

networrk[networrk == 1] <- 0 # these lines can be modified to change the cell values to indicate which levels of resolution 
networrk[networrk == 2] <- 1 # you would like for your network. All values in matrix should be 0 or 1
networrk[networrk == 3] <- 1

nett <- as.matrix(networrk) #converts to matrix
pan <- graph_from_adjacency_matrix(nett, mode = "undirected", weighted = TRUE ) #can be directed or undirected matrix


#this next line plots the network.
plot(pan, vertex.size= 2, vertex.color = "blue", vertex.label = "", edge.curved = 0, 
     layout=layout_with_graphopt, edge.width=0.2, edge.color = "black", main = "Social Network of everyone with at least a score of 1 (Familiar Faces)")

corelist <- coreness(pan, mode = "in") #start the k-core analysis
pop <- sort(corelist, decreasing = TRUE)
plot(pop, xaxt="n", xlab = "Pearlies", ylab = "Coreness" ) #plotting coreness
axis(1,at=1:108,labels=names(pop))
pop
plot()
##################
networrk2 <- read.csv( "pearlz.csv", header = TRUE, sep = ",")
North <- as.matrix(networrk2)
pan <- graph_from_adjacency_matrix(North, mode = "undirected", weighted = TRUE, add.colnames = 'label' )

networrk2[networrk2 == 1] <- 0
networrk2[networrk2 == 2] <- 0
networrk2[networrk2 == 3] <- 1

plot(pan, vertex.size=0, vertex.color = "blue", vertex.label = V(pan)$name, edge.curved = 0.3, #in this plot of the data, the nodes are labeled.
     layout=layout_in_circle, edge.width=0.3, edge.color = "black")

i##################
networrk3 <- read.csv( "UpperNorth2.csv", header = TRUE, sep = ",")
North <- as.matrix(networrk3)
pan <- graph_from_adjacency_matrix(North, mode = "undirected", weighted = TRUE, add.colnames = 'label' )

networrk[networrk == 1] <- 0
networrk[networrk == 2] <- 0
networrk[networrk == 3] <- 1

plot(pan, vertex.size=2, vertex.color = "blue", vertex.label = "", edge.curved = 0,
     layout=layout_in_circle, edge.width=0.3, edge.color = "black")

