# STAT628-Module2-Group2
## Introduction:
Estimating body fat percentage is one of the crucial components in assessing an individual’s health and risk for various diseases. One of the traditional methods of measuring a person’s body fat percentage is to weigh them on dry land and then weigh them while in the water. These methods are inconvenient and costly in clinical settings. This project aims to develop a simple, robust, and accurate model to estimate body fat percentage using available clinical data such as age, weight, height, BMI, and body circumference measurements. 

## Data Cleaning
The data is based on the real data set of 252 men in U.S. Navy with measurements of their body fat percentage and various body circumference measurements. In this model, we select the IQR (Interquartile Range Method) Method to clean the data set. It is a common method for detecting outliers in the dataset. IQR is required to calculate the first and third quartile of the data. By using these values, we can calculate the IQR which is the third quartile value subtracted by the first quartile value (IQR = Q3 – Q1). Then, we can determine the outlier by setting the lower bound, typically defined as the first quartile subtracted by 1.5 times IQR (Lower Bound = Q1 – 1.5 * IQR), and the upper bound, defined as the third quartile plus 1.5 times IQR (Upper Bound = Q3 + 1.5 * IQR). In this case, we will remove an outlier where INDO is 216 due to the high body fat that is outside the upper bound.Also, we imputed the body fat percentage for IDNO 182 was imputed to 4.42% based on an estimation model from a popular body fat calculator available online (FreeDieting, n.d.).

## Body Fat Percentage Prediction using Linear Regression

This repository contains code to predict body fat percentage using linear regression. The code selects relevant features using Recursive Feature Elimination (RFE) and evaluates the model's performance with various metrics such as R² and RMSE. Additionally, it generates diagnostic plots to check model assumptions.


Table of Contents

Requirements

Code Structure

Usage

Results

License

### Requirements

The following Python libraries are required to run the code:

numpy
pandas
scikit-learn
matplotlib
seaborn
scipy

### Code Structure

Feature Selection and Model Training (feature_selection.py): This script performs feature selection using Recursive Feature Elimination (RFE), fits a linear regression model, and evaluates its performance using R² and RMSE.

Visualization and Diagnostics (visualization.py): Generates diagnostic plots, including:

R² vs. Number of Features plot.
Residuals vs. Fitted Values plot.
Normal Q-Q plot to assess residual normality.

Results: The results include the best feature set, the regression model's coefficients, and various diagnostic metrics.

### Usage

1. Running the Feature Selection and Model Training
2. Generating Diagnostic Plots


### Results
Selected Features:
The selected features from RFE are:

ADIPOSITY
NECK
ABDOMEN
HIP
BICEPS
WRIST
Model Performance:
Test Set R²: 0.6930
Test Set MSE: 19.6145
Intercept: 10.72
Coefficients:
ADIPOSITY: 0.375
NECK: -0.566
ABDOMEN: 0.799
HIP: -0.299
BICEPS: 0.238
WRIST: -1.716
Visualizations:
R² vs. Number of Features
Residuals vs. Fitted Values
Normal Q-Q Plot




## Contribution
Zekai Xu

Jiren Lu

Zhenke Peng
