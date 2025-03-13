# Installing packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
#install.packages("BiocManager")
BiocManager::install(version = "3.20")

BiocManager::install("tidyverse")

# Loading packages
library(BiocManager)
library(tidyverse)
