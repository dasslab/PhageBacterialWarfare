
#Template Script - Bar Plots

# Load required libraries
library(ggplot2)
library(dplyr)

# Read the data from a CSV file
# 'input_file.csv' contains the Genes/Pathways information along with a column containing Abundance (Gene counts/ RA etc..)

data <- read.csv("input_file.csv", stringsAsFactors = FALSE)

# Ensure data is sorted by Count in descending order
data <- data %>% arrange(desc(Count))

# Plot
ggplot(data, aes(x = reorder(Gene, Count), y = Count, fill = Gene)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  geom_text(aes(label = Count), hjust = -0.2) +
  theme_classic() +
  guides(fill = "none") +
  labs(title = "Title", x = "Gene/Function/Pathway", y = "Gene Count/RA")

#Save the data (Optional)

ggsave("filename.png", plot=ggplot, height=10, width=10)