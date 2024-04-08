### Z2 MIRIAN FELICES RUIZ ###
# To begin this task, first of all, I chose a series of data in the link proposed by the teacher.
# I chose the one called "Average Heights and Weights for American Women"
# Since I didn't know how to download it, I searched the internet and found that I had to put the following code:
data(women)
# In order to see the table well, I wrote:
View(women)
# To understand the table limits, I wrote the following:
summary (women)
# Before creating my hypothesis, I investigated with the example that was given to me on the website itself and added what we did in class on monday 8th (color the plot):
require(graphics)
plot(women, 
     xlab = "Height (in)", 
     ylab = "Weight (lb)",
     main = "Women data: American women aged 30-39",
     pch=16,
     col="pink")

# Since the data shows a gradual increase in weight as height increases, it is possible, we can observe a positive trend in your graph, indicating a positive correlation between height and weight.

# Then, we create the hypothesis:
# Hypothesis: There is a significant relationship between height and weight for American women ages 30 to 39, and this relationship varies by body mass index (BMI), being more pronounced in women with a BMI in the healthy range (18.5 to 24.9).

# Firstly, we have to calculate the BMI
# We follow this formula: BMI = (Weight (lbs)) / (Height (in))^2 *703
# We have to create a function to calculate the BMI
BMI <- function(w,h){
  result <- (w/h^2)*703
  return (result)
}
# We check that it works
BMI(115,58)

#We want to add a third column to the table where the BMI of all
bmi_data <- women$weight / (women$height * women$height) * 703
#Now we modify the data frame adding this new column
women$BMI <- bmi_data
print(women)

#After today's class (Monday), I discovered that it can be done in the following way as well:
women <- mutate(women, #adding new column based on a condition
                 BMI = weight/(height*height) ) 

# Since the relationship is more pronounced in women with a BMI in the healthy range (18.5 to 24.9), we first have to classify what percentage of women are in the healthy range.
# To do this, we will create the following function:
bmi_classifier <- function(bmi_data) {
  if (bmi_data > 18.5 & bmi_data < 24.9) {
    bmi_class <-  'Healthy'
  } else {
    bmi_class <-  'Not healthy'
  }
  return(c(bmi_data, bmi_class))
}
# Now we see which of our group of women has a healthy bmi
# After trying and failing, I searched the internet and discovered that "bmi_data" is a vector with multiple elements, and the if construct in R can only handle a logical condition for a single value, not for an entire vector.
#Therefore, I have found out that putting the following creates a function applicable to integer vectors
bmi_classifier <- function(bmi_data) {
  bmi_class <- ifelse(bmi_data > 18.5 & bmi_data < 24.9, 'Healthy', 'Not healthy')
  return(cbind(bmi_data, bmi_class))
}
result_bmi <- bmi_classifier(bmi_data)
result_bmi

# We apply this new vector as a fourth column to our table
women$Classifier <- result_bmi
print(women)
# Since all our data is between 18.5 and 24.9, we can affirm that all our women have a healthy BMI

# To finally see if there is a significant relationship between height and weight, we are calculating the correlation
# Correlation is a statistical measure (between -1 and 1) that describes the relationship between two variables (height and weight)
# If the correlation coefficient is significantly positive, it implies that taller women tend to weigh more, supporting our hypothesis. 
# If the correlation is close to zero or negative, it suggests a weak or inverse relationship between height and weight.
# To calculate correlation, we have to put:
correlation <- cor(women$height, women$weight)
print(correlation)
# Since our correlation is a very high number (0.9954948), this means that, in general, as a woman's height increases, her weight also tends to increase in proportion
# Finally, we can conclude that our hypothesis is true.
# But, although there is a strong correlation between height and weight, we cannot conclude that height causes weight or vice versa. Other factors may be contributing to this relationship, and more research would be needed to reach a solid and safe conclusion.