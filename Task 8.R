### Task 8
#1
library(devtools)
devtools::install_github("hirscheylab/tidybiology")
library(tidybiology)

#1a
data("chromosome")
View(chromosome)

chromosome_stats <- chromosome %>%
  pivot_longer(cols = c("variations", "protein_codinggenes", "mi_rna")) %>%
  group_by(name) %>%
  summarise(
    Mean = mean(value, na.rm = TRUE),
    Median = median(value, na.rm = TRUE),
    Max = max(value, na.rm = TRUE))
chromosome_stats

#1b
ggplot(chromosome, aes(x = length_mm)) +
  geom_histogram(bins=15) +
  ggtitle("Chromosome length [mm]") + 
  labs(x="", y="Count") +
  theme_classic()

#1c
library(ggpubr)

ggplot(chromosome, aes(x = length_mm, y = protein_codinggenes)) + 
  geom_point(size=4, color="#A31530") + # Data points (dots)
  geom_smooth(method = "lm", se = FALSE, linewidth=2, color="black") + # Linear line
  stat_cor(method="spearman",  digits = 2, size=4) + # Statistics; R and P
  labs(x="Chromosome length [mm]", y="No. protein-coding genes") +
  theme_classic()

ggplot(chromosome, aes(x = length_mm, y = mi_rna)) + 
  geom_point(size=4, color="#FA9757") + # Data points (dots)
  geom_smooth(method = "lm", se = FALSE, linewidth=2, color="black") + # Linear line
  stat_cor(method="spearman",  digits = 2, size=4) + # Statistics; R and P
  labs(x="Chromosome length [mm]", y="No. miRNAs") +
  theme_classic()

#1d
data("proteins") 
proteins_dt <- as.data.table(proteins) #Turn into data table for conveniance. 
View(proteins)

protein_stats <- proteins%>%
  pivot_longer(cols = c("length", "mass")) %>%
  group_by(name) %>%
  summarise(
    Mean = mean(value, na.rm = TRUE),
    Median = median(value, na.rm = TRUE),
    Max = max(value, na.rm = TRUE))
protein_stats

ggplot(proteins_dt, aes(x = mass, y = length)) + 
  geom_point(size=4, color="#89AEE6") + # Data points (dots)
  geom_smooth(method = "lm", se = FALSE, linewidth=1, color="black", linetype="dashed") + # Linear line
  stat_cor(method="spearman",  digits = 2, size=4) + # Statistics; R and P
  labs(x="Protein mass", y="Protein length") +
  theme_classic()

#Same scatter plot, but removing two obvious outliers
3816030
ggplot(proteins_dt[mass<1519175,], aes(x = mass, y = length)) + 
  geom_point(size=4, color="#89AEE6") + # Data points (dots)
  geom_smooth(method = "lm", se = FALSE, linewidth=1, color="black", linetype="dashed") + # Linear line
  stat_cor(method="spearman",  digits = 2, size=4) + # Statistics; R and P
  annotate("text", x = 805253-140000, y = 8384, label = "MUC19", size=3, colour='black', fontface="bold", family="Arial", hjust=0, vjust=0) + #Text for protein that stands out; the protein found by using the View function and a bit of trial and error.
  labs(x="Protein mass", y="Protein length") +
  theme_classic()
