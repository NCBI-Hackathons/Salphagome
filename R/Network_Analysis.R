### This R script is used to generate a network of the differnet phages based on the correlation of their prevalence

## Dependencies
library(tidyverse)
library(tidygraph)
library(ggraph)
library(corrr)
library(igraph)

data=read.csv("prevalence_table.csv",row.names=1,header=T)
#Compute the correlation matrix
res.cor <- data[,-c(5,6)]  %>%
   t() %>% correlate() %>%
   shave(upper = TRUE) %>%
   stretch(na.rm = TRUE) %>%
   filter(r >= 0.95)

#Create the correlation network graph object
cor.graph <- as_tbl_graph(res.cor, directed = FALSE)

# Node groups info
cor.group <- data_frame(
   name = rownames(data),
   Enrichment_Group = as.factor(data$Enrichment.Group))
   
# Modify the nodes data
cor.graph <- cor.graph %>%
   activate(nodes) %>%
   left_join(cor.group, by = "name") %>%
   rename(label = name)
   
#Visualize the correlation network and phage clusters
cor.graph %>%
   activate(nodes) %>%
   mutate(Clusters = as.factor(group_infomap())) %>% 
   ggraph(layout = "graphopt") + 
   geom_edge_link(width = 1, colour = "lightgray") +
   geom_node_point(aes(colour = Enrichment_Group), size = 4) +
   geom_node_text(aes(label = label), size=4,repel = TRUE)+
   theme_graph()
