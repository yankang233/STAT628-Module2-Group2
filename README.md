# STAT628-Module2-Group2
## Introduction:
Estimating body fat percentage is one of the crucial components in assessing an individual’s health and risk for various diseases. One of the traditional methods of measuring a person’s body fat percentage is to weigh them on dry land and then weigh them while in the water. These methods are inconvenient and costly in clinical settings. This project aims to develop a simple, robust, and accurate model to estimate body fat percentage using available clinical data such as age, weight, height, BMI, and body circumference measurements. 

## Data Cleaning
The data is based on the real data set of 252 men in U.S. Navy with measurements of their body fat percentage and various body circumference measurements. In this model, we select the IQR (Interquartile Range Method) Method to clean the data set. It is a common method for detecting outliers in the dataset. IQR is required to calculate the first and third quartile of the data. By using these values, we can calculate the IQR which is the third quartile value subtracted by the first quartile value (IQR = Q3 – Q1). Then, we can determine the outlier by setting the lower bound, typically defined as the first quartile subtracted by 1.5 times IQR (Lower Bound = Q1 – 1.5 * IQR), and the upper bound, defined as the third quartile plus 1.5 times IQR (Upper Bound = Q3 + 1.5 * IQR). In this case, we will remove an outlier where INDO is 216 due to the high body fat that is outside the upper bound.

## Contribution
Zekai Xu

Jiren Lu

Zhenke Peng
