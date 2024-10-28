#This code in RStudio normalized datasets using Vsn

library(Biobase)
library(vsn)
data <- read.csv("C:/Users/elvka/.Desktopreal/university/Thesis/Data/CSF/SomaScan/syn30549757_Somascan_proteomics_1.csv", row.names = 1)
exprs_matrix <- as.matrix(data)
pheno_data <- data.frame(row.names = colnames(data))
expr_set <- ExpressionSet(assayData = exprs_matrix, phenoData = AnnotatedDataFrame(pheno_data))

vsn_normalized <- vsn2(expr_set)
meanSdPlot(vsn_normalized)


normalized_data <- exprs(vsn_normalized)
write.csv(normalized_data, "C:/Users/elvka/.Desktopreal/university/Thesis/Data/CSF/SomaScan/syn30549757_Somascan_norm.csv", row.names = TRUE)




