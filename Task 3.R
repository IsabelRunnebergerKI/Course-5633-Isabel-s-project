### Task 3
# Installing packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
#install.packages("BiocManager")
BiocManager::install(version = "3.20")

BiocManager::install("tidyverse")
BiocManager::install("data.table")

# Loading packages
library(BiocManager)
library(tidyverse)
library(data.table)
