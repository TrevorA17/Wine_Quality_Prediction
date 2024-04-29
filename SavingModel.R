# Saving the best Random Forest model
saveRDS(rf_model$finalModel, "./models/rf_model.rds")

# Load the saved model
loaded_rf_model <- readRDS("./models/rf_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  fixed_acidity = 7.4,
  volatile_acidity = 0.7,
  citric_acid = 0.0,
  residual_sugar = 1.9,
  chlorides = 0.076,
  free_sulfur_dioxide = 11,
  total_sulfur_dioxide = 34,
  density = 0.9978,
  pH = 3.51,
  sulphates = 0.56,
  alcohol = 9.4
)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_rf_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
