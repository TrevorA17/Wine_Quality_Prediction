# Load the saved Random Forest model
loaded_rf_model <- readRDS("models/rf_model.rds")

#* @apiTitle Wine Quality Prediction Model API
#* @apiDescription Used to predict wine quality.

#* @param fixed_acidity Fixed acidity of the wine
#* @param volatile_acidity Volatile acidity of the wine
#* @param citric_acid Citric acid content of the wine
#* @param residual_sugar Residual sugar content of the wine
#* @param chlorides Chlorides content of the wine
#* @param free_sulfur_dioxide Free sulfur dioxide content of the wine
#* @param total_sulfur_dioxide Total sulfur dioxide content of the wine
#* @param density Density of the wine
#* @param pH pH value of the wine
#* @param sulphates Sulphates content of the wine
#* @param alcohol Alcohol content of the wine

#* @get /wine_quality_prediction

predict_wine_quality <- function(fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
                                 chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density, pH,
                                 sulphates, alcohol) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    fixed_acidity = as.numeric(fixed_acidity),
    volatile_acidity = as.numeric(volatile_acidity),
    citric_acid = as.numeric(citric_acid),
    residual_sugar = as.numeric(residual_sugar),
    chlorides = as.numeric(chlorides),
    free_sulfur_dioxide = as.numeric(free_sulfur_dioxide),
    total_sulfur_dioxide = as.numeric(total_sulfur_dioxide),
    density = as.numeric(density),
    pH = as.numeric(pH),
    sulphates = as.numeric(sulphates),
    alcohol = as.numeric(alcohol)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_rf_model, newdata = to_be_predicted)
  
  # Return the prediction
  return(prediction)
}
