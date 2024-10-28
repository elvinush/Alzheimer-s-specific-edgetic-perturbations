#This script normalized datasets using CyclicLoess normalization

library(Biobase)
library(limma)
library(vsn)
data <- read.csv("C:/Users/elvka/.Desktopreal/university/Thesis/Data/Brain/LFQ/UPenn/UPenn_Proteomics_LFQ_v2.csv", row.names = 1)
data_matrix <- as.matrix(data)
normalized_matrix <- normalizeCyclicLoess(data_matrix)
meanSdPlot(normalized_matrix)
normalized_data <- as.data.frame(normalized_matrix)
write.csv(normalized_data, "C:/Users/elvka/.Desktopreal/university/Thesis/Data/Brain/LFQ/UPenn/UPenn_norm.csv", row.names = TRUE)

