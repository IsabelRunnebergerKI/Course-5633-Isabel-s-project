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
