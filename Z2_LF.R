#install.packages("datasets")
#install.packages("ggplot2")
library("datasets")
library("ggplot2")
data("mtcars")
View(mtcars)

# Hypothesis: Horsepower, weight of the vehicle, number of cylinders and displacement of the vehicle 
# are negatively correlated with the distance they can drive with one gallon (miles per gallon, mpg).
# I have chosen this hypothesis because, in my experience, I think this could be statistically important. 


#### GRAPHS

# These are scatter plots of mpg (dependent variable) and other independent variables (hp, wt, cyl, disp)

ggplot(mtcars, aes(x=mpg, y=hp)) + geom_point() 
ggplot(mtcars, aes(x=mpg, y=wt)) + geom_point()
ggplot(mtcars, aes(x=mpg, y=cyl)) + geom_point()
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point()


#### CORRELATION 

### CORRELATION BETWEEN MPG AND HP

correlation_mpg_hp <- round(cor(mtcars$hp, mtcars$mpg), 4)

ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  labs (x = "Horsepower", y = "Miles per Gallon") + # The names of the axis
  geom_smooth(method = "lm", se = F) + # To add the correlation line, se = F means that I suppressed confidence intervals
  geom_text(x = min(mtcars$hp), y = max(mtcars$mpg), label = paste("Correlation:", round(correlation_mpg_hp, 4)), hjust = -2.5, vjust = 1)

# I got correlation: -0.7762.
# This is a high negative correlation.

### CORRELATION BETWEEN MPG AND WT

correlation_mpg_wt <- round(cor(mtcars$wt, mtcars$mpg), 4)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs (x = "Weight of the vehicle", y = "Miles per Gallon") + # The names of the axis
  geom_smooth(method = "lm", se = F) + # To add the correlation line, se = F means that I suppressed confidence intervals
  geom_text(x = min(mtcars$wt), y = max(mtcars$mpg), label = paste("Correlation:", round(correlation_mpg_wt, 4)), hjust = -2.5, vjust = 1)

# I got correlation: -0.8677.
# This is a high negative correlation.

### CORRELATION BETWEEN MPG AND CYL 

correlation_mpg_cyl <- round(cor(mtcars$cyl, mtcars$mpg), 4)

ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point() +
  labs (x = "Number of cylinders", y = "Miles per Gallon") + # The names of the axis
  geom_smooth(method = "lm", se = F) + # To add the correlation line, se = F means that I suppressed confidence intervals
  geom_text(x = min(mtcars$cyl), y = max(mtcars$mpg), label = paste("Correlation:", round(correlation_mpg_cyl, 4)), hjust = -2.5, vjust = 1)

# I got correlation: -0.8522.
# This is a high negative correlation.

### CORRELATION BETWEEN MPG AND DISP

correlation_mpg_disp <- round(cor(mtcars$disp, mtcars$mpg), 4)

ggplot(mtcars, aes(x = disp, y = mpg)) +
  geom_point() +
  labs (x = "Motor displacement", y = "Miles per Gallon") + # The names of the axis
  geom_smooth(method = "lm", se = F) + # To add the correlation line, se = F means that I suppressed confidence intervals
  geom_text(x = min(mtcars$disp), y = max(mtcars$mpg), label = paste("Correlation:", round(correlation_mpg_disp, 4)), hjust = -2.5, vjust = 1)

# I got correlation: -0.8476.
# This is a high negative correlation.


#### MULTIPLE LINEAR REGRESSION ANALYSIS

mlra <- lm(mpg ~ hp + wt + cyl + disp, data=mtcars) # Linear regression model - relationship between mpg (dependent variable) and other independent variables (hp, wt, cyl, disp)
summary(mlra)
# p-value: 1.061e-10 - it is statistically significant.


#### Calculating the means of mpg with 4, 6, 8 cylinders, respectively.  

#install.packages("dplyr)
library("dplyr")

calculate_mean <- function(cyl_num) { # Function named calculate_mean
  if (cyl_num %in% c(4, 6, 8)) {
    cyl_x <- mtcars %>% 
      filter(cyl==cyl_num) %>% select(mpg) # Filtering the data and selecting mpg by number of cyl
    mean_cyl <- mean(cyl_x$mpg) # Calculate the mean
    return (round(mean_cyl, 4)) # Return the calculate mean
    } else {
      print("This is not the correct number of cylinders.")
  }  
}

mean_cyl_4 <- calculate_mean(4)
mean_cyl_4
mean_cyl_6 <- calculate_mean(6)
mean_cyl_6
mean_cyl_8 <- calculate_mean(8)
mean_cyl_8

# mean_cyl 4 = 26.6636
# mean_cyl_6 = 19.7429
# mean_cyl_8 = 15.1
# With this I have shown that average mpg is greater if you have 4 cylinders in comparison to 
# 6 cylinders and that compared to 8 cylinders.

mean_cyl_4 > mean_cyl_6
mean_cyl_6 > mean_cyl_8

# CONCLUSION: the initial hypothesis is true and I have shown that wt, hp, cyl and disp 
# negatively correlate with mpg meaning that the more cylinders you have, mpg is lower.