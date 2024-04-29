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

# Check for missing values
missing_values <- anyNA(wine_data)

# Display result
if (missing_values) {
  print("The dataset contains missing values.")
} else {
  print("The dataset does not contain missing values.")
}

# Select only numeric variables for transformation
numeric_vars <- wine_data[, sapply(wine_data, is.numeric)]

# Perform standardization (z-score normalization) on numeric variables
standardized_data <- scale(numeric_vars)

# Convert the standardized data back to a data frame
standardized_df <- as.data.frame(standardized_data)

# Replace the numeric variables in the original dataset with the standardized ones
wine_data[, sapply(wine_data, is.numeric)] <- standardized_df

# View the transformed dataset
head(wine_data)
