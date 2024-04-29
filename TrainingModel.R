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

# Load the required library
library(caret)

# Set seed for reproducibility
set.seed(123)

# Split the dataset into training and testing sets (70% training, 30% testing)
train_indices <- createDataPartition(wine_data$quality, p = 0.7, list = FALSE)
train_data <- wine_data[train_indices, ]
test_data <- wine_data[-train_indices, ]

# Summary of the split
cat("Training set size:", nrow(train_data), "\n")
cat("Number of variables in training set:", ncol(train_data), "\n")
cat("\n")
cat("Testing set size:", nrow(test_data), "\n")
cat("Number of variables in testing set:", ncol(test_data), "\n")

# Set seed for reproducibility
set.seed(123)

# Number of bootstrap iterations
num_iterations <- 1000

# Function to calculate the statistic of interest (e.g., mean, median) from a sample
calculate_statistic <- function(data) {
  # Example: Calculate the mean of the 'quality' variable
  return(mean(data$quality))
}

# Perform bootstrapping
bootstrap_results <- replicate(num_iterations, {
  # Sample with replacement
  boot_sample <- wine_data[sample(nrow(wine_data), replace = TRUE), ]
  # Calculate the statistic of interest
  calculate_statistic(boot_sample)
})

# Summary of bootstrapped results
summary(bootstrap_results)

# Load the required library
library(caret)

# Define the number of folds
num_folds <- 10  # You can adjust this value based on your preference

# Define the control parameters for cross-validation
train_control <- trainControl(method = "cv", number = num_folds)

# Define the model training
# Example: Linear regression using the 'lm' function
model <- train(quality ~ ., data = wine_data, method = "lm", trControl = train_control)

# Display the model performance
print(model)

# Load the required libraries
library(caret)
library(randomForest)

# Set seed for reproducibility
set.seed(123)

# Define the control parameters for cross-validation
train_control <- trainControl(method = "cv", number = 10)

# Model training - Linear Regression
linear_model <- train(quality ~ ., data = wine_data, method = "lm", trControl = train_control)

# Model training - Random Forest
rf_model <- train(quality ~ ., data = wine_data, method = "rf", trControl = train_control)

# Display model performance
print(linear_model)
print(rf_model)

# Load the required library
library(caret)

# Compare model performance using resamples
model_comparison <- resamples(list(LinearRegression = linear_model, RandomForest = rf_model))

# Summarize the results
summary(model_comparison)

