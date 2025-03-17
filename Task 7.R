### Task 7


install.packages("remotes")
library(remotes)
install_url("http://emotion.utu.fi/wp-content/uploads/2019/11/nummenmaa_1.0.tar.gz",dependencies=TRUE)

#1
magic_guys <- as.data.table(read.csv("magic_guys.csv"))

#1a
hist(magic_guys[species=="jedi", length])
hist(magic_guys[species=="sith", length])

hist(magic_guys[species=="jedi", length], breaks = 20)
hist(magic_guys[species=="sith", length], breaks = 10)

library(ggplot2)
ggplot(magic_guys, aes(x = length, fill = species)) +
  geom_histogram(binwidth = 7, position = "dodge") +
  labs(x = "Length", y = "Frequency", fill = "Species") +
  ggtitle("Species length") +
  scale_fill_manual(values = c("lightblue", "pink")) + 
  theme_classic()
  
#1b
ggplot(magic_guys, aes(y = length, x = species, fill = species)) +
  geom_boxplot() +
  labs(x = "Species", y = "Length") +
  ggtitle("Species length") +
  scale_fill_manual(values = c("lightblue", "pink")) + 
  theme_classic()

#1c
ggsave("Figure_1.png", width = 5,height = 5)
ggsave("Figure_1.pdf", width = 5,height = 5)
ggsave("Figure_1.svg", width = 5,height = 5)

#PNG: A raster image with a transparent background, suitable for web display or when you want to include the plot in a Word document or PowerPoint presentation.
#PDF: High-quality vector graphics that can be resized without loss of quality. PDF is suitable for publications, reports, and presentations.
#SVG: Vector graphics that can be edited with software like Adobe Illustrator. This is my standard choice, as I use Illustrator to put my manuscript figures together. 

#2
microarray_data <- read.delim("microarray_data.tab", header = TRUE, sep = "\t")

#2a
#There's 553 rows, 1000 columns. 

#2b
microarray_data_NAs <- sapply(microarray_data, function(y) sum(is.na(y)))
microarray_data_NAs <- as.data.table(microarray_data_NAs)
View(microarray_data_NAs)

ggplot(microarray_data_NAs, aes(x = microarray_data_NAs)) +
  geom_histogram() +
  ggtitle("Missing values") + 
  theme_classic()

#2c
microarray_data_pcNAs <- as.data.table(microarray_data_NAs/nrow(microarray_data)) #Calculating % of missing values
microarray_data_pcNAs[,"gene":= colnames(microarray_data)]
microarray_data_NApc10 <- microarray_data_pcNAs[microarray_data_NAs>0.1,] #Checking for 10% (0.1)
microarray_data_NApc20 <- microarray_data_pcNAs[microarray_data_NAs>0.2,]
microarray_data_NApc30 <- microarray_data_pcNAs[microarray_data_NAs>0.3,]

#2d
microarray_data_colmeans <- colMeans(microarray_data, na.rm = TRUE) #Calculating mean value for each gene
microarray_data2 <- microarray_data #Creating a copy of the data set to not overwrite
for (col in 1:ncol(microarray_data2)) {
  microarray_data2[is.na(microarray_data2[, col]), col] <- microarray_data_colmeans[col]
}

#3
View(CO2_dt)
ggplot(CO2_dt, aes(y=uptake, x=Treatment, fill=as.factor(conc)))+
  geom_bar(stat = "summary", fun="mean", position = "dodge")+
  facet_wrap(.~Type)+
  labs(x="Treatment", y="Mean CO2 uptake", fill="Concentration")+
  theme_light()
# The uptake of CO2 is in general higher in Quebec than in Mississippi, but it's dependent on treatment of the plant (non-chilled takes up more) and concentration of CO2.