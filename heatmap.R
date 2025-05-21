# Template Script: Heatmap for Defense Systems

library(ggplot2)
library(reshape2)
library(gridExtra)

# Read the data from a CSV file

df <- read.csv("input_file.csv", stringsAsFactors = FALSE)

# Reorder columns if needed (optional)

df <- df[, c("Assembly", "Abortive_Infection", "CRISPR_Cas", "RosmerTA", "Restriction_Modification", "Others", "Total")]


# Melt data for heatmap (excluding the 'Total' column)

df_melt <- melt(df[, 1:6], id.vars = "Assembly")

# Clean variable names (replace underscores with spaces)

df_melt$variable <- gsub("_", " ", df_melt$variable)

# Generate heatmap

heatmap_plot <- ggplot(df_melt, aes(x = variable, y = Assembly, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = value), color = "black") +
  scale_fill_gradient(low = "#f0f9e8", high = "grey") +
  theme_classic() +
  labs(title = "Bacterial Defense Systems", x = NULL, y = NULL) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none"
  )

# Save heatmap
ggsave("defense_heatmap.png", plot = heatmap_plot, height = 3.5, width = 3.5)
