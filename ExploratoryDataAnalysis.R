# Load the wine quality dataset
wine_data <- read.csv("data/WineQT.csv", colClasses = c(
  fixed_acidity = "numeric",
  volatile_acidity = "numeric",
  citric_acid = "numeric",
  residual_sugar = "numeric",
  chlorides = "numeric",
  free_sulfur_dioxide = "numeric",
  total_sulfur_dioxide = "numeric",
  density = "numeric",
  pH = "numeric",
  sulphates = "numeric",
  alcohol = "numeric",
  quality = "numeric",
  Id = "character"
), header = TRUE)

# Display the structure of the dataset
str(wine_data)

# View the first few rows of the dataset
head(wine_data)

# Remove the last column
wine_data <- wine_data[, -ncol(wine_data)]

# Open the dataset in a viewer window
View(wine_data)

# Calculate measures of frequency
summary_stats <- summary(wine_data)

# Display the measures of frequency
print(summary_stats)

# Calculate measures of central tendency
means <- colMeans(wine_data, na.rm = TRUE)
medians <- apply(wine_data, 2, median, na.rm = TRUE)

# Calculate mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
modes <- sapply(wine_data, getmode)

# Create a data frame to display the measures
central_tendency <- data.frame(
  Variable = names(wine_data),
  Mean = means,
  Median = medians,
  Mode = modes
)

# Print the measures of central tendency
print(central_tendency)

# Calculate measures of distribution
ranges <- apply(wine_data, 2, function(x) diff(range(x, na.rm = TRUE)))
variances <- apply(wine_data, 2, var, na.rm = TRUE)
standard_deviations <- apply(wine_data, 2, sd, na.rm = TRUE)

# Create a data frame to display the measures
distribution_measures <- data.frame(
  Variable = names(wine_data),
  Range = ranges,
  Variance = variances,
  Standard_Deviation = standard_deviations
)

# Print the measures of distribution
print(distribution_measures)

# Calculate measures of relationship (correlation)
correlation_matrix <- cor(wine_data, use = "pairwise.complete.obs")

# Print the correlation matrix
print(correlation_matrix)

