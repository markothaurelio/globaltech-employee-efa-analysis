# Load necessary libraries
library(psych)
library(nFactors)

setwd("C:/Users/liamh/OneDrive/Documents/ECU/Data Science Masters/done/Multivar/Module 10/worksheet")

## Load the data
employee_data <- read.csv("employee_survey_data.csv")
head(employee_data)

## Check for missing data
sum(is.na(employee_data))

## Determine the Number of Factors
# Parallel Analysis
ev <- eigen(cor(employee_data))  # Extract eigenvalues
ap <- parallel(subject = nrow(employee_data), var = ncol(employee_data), rep = 100, cent = 0.05)  # Parallel analysis
ns <- nScree(x = ev$values, aparallel = ap$eigen$qevpea)  # Scree plot based on parallel analysis
plotnScree(ns)  # Plot the scree plot to visualize

# Number of factors based on Parallel Analysis
num_factors <- 5  # 5 was chosen based on the scree plot

## Factor Analysis with PCA Extraction
# PCA with Varimax rotation
fa_pca <- principal(employee_data, nfactors = num_factors, rotate = "varimax")
# Show the loadings with cutoff at 0.4
print(fa_pca$loadings, cutoff = 0.4, sort = TRUE)

fa.diagram(fa_pca) #  Factor Analysis diagram

# Factors and the variables plot
plot(fa_pca, labels = colnames(employee_data))



