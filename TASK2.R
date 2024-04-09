
#HOMEWORK2

#PABLO_SÁNCHEZ-CRESPO_PÉREZ

data(package = .packages(all.available = TRUE))
View(women)

#HYPOTHESIS

#There is a positive correlation between height (in) and weigth (lb) of American womens aged 30-39. Therefore, 
#if one increase, the other does it. 

#First, I create 2 vectors with weigth and height containing the  values of 15 diffferent American
#women:

Height <- c(115, 117, 120, 123, 126, 129, 132, 135, 139, 142, 146, 150, 154, 159, 164) #in l
Weight <- c(58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72) #in kilograms

#After creating the vectors, I calculate the Pearson´s correlation coefficient (r):

correlation <- cor(Height, Weight)
print(correlation)

# r= 0.9954948
# Now, as this value is possitive, it shows a possitive correlation between both variables. Moreover,
#this value is also near 1, so it shows even more that is a strong possitive correlation.

cor.test(Weight, Height)

# t = 37.855, df = 13, p-value = 1.091e-14
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
  #0.9860970 0.9985447
#sample estimates:
  #cor 
#0.9954948 

#These are the values shown by the correlation test. The p-value is less than 0.05, so the p-value shows
#that that there is a statistically significant relationship between height and weight.

#To check even more than the hypothesis is true and there is a positive correlation between height and 
#weight, I will do a linear regression:

#model <- lm(Weight ~ Height, data = women)
#summary(model)
#lm(formula = Weight ~ Height, data = women)
#Residuals:
#   Min       1Q   Median       3Q      Max 
#-0.83233 -0.26249  0.08314  0.34353  0.49790 
#Coefficients:
#.            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 25.723456   1.043746   24.64 2.68e-12 ***
#Height       0.287249   0.007588   37.85 1.09e-14 ***

#Once all the information about the regression coefficients is obtained, is necessary to interpret them.
#As the coefficient for height is possitive, indicates that the relationship between both variables is 
#possitive.

#After that, I am going to represent this relationship by plotting the regression line over a graph:

plot(women, xlab = "Height (in)", ylab = "Weight (lb)",
     main = "American women aged 30-39")


#As it seen in the graph, the regression line fits very well with the points that represent the data,
#indicating that the hypothesis is finally true because of this and the rest of the evidences done 
#in the previous steps. 

#In conclusion, is true that there is a posstive correlation between height and weigth for American women.



