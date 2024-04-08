data(package = .packages(all.available = TRUE))
View(cars)

#HYPOTHESIS:
#The higher the speed, the longer distance it will take the car to stop.

# First, I check the max and min speeds and distances recorded.
max(cars$speed)
#25
min(cars$speed)
#4

max(cars$dist)
#120
min(cars$dist)
#2

speed <- runif(50, min = 4, max = 25)  #Speed  in mph 
speed
#[1]  4.425983 16.364728 14.822864 10.931572 22.209409  7.693130  4.094965 10.346188 13.061048 22.294263 24.289455 11.948724 
#[13]  4.536825 23.358465 16.066882 16.512139 13.088613 17.968930 20.509444  9.585384 21.436379 24.010439  9.159499 22.878454
#[25]  7.828041 19.010222  8.855162 16.668598 20.582728 20.354106 16.823687 19.640853 12.593370 24.110514 18.134584 19.521724
#[37] 10.818193 18.451393 20.748165 23.982866  7.903718 17.193679  9.658846  5.410746  8.160227  6.495671  5.113037 13.760372
#[49]  5.688037  7.250290

distance_to_stop <- runif(50, min = 2, max = 120)  #Distance to stop in feet 
distance_to_stop
#[1]  26.336159  60.405128   4.878632  28.231883  95.659718  74.125068  82.098227  42.240019 116.448963 102.123329  99.556476
#[12]  28.815986  10.322927  37.549813  27.536548  57.080446  96.137759  50.182088   3.936975  61.880659  55.773717  79.016984
#[23]  98.590889  83.701738  78.436608  14.921215  49.976485   3.402266  37.257142  30.996912  54.326295  74.470648 112.016052
#[34]  81.153987  44.984494  22.641191  55.929837  53.513728  40.784566  83.011511  25.852557 102.921432 106.984782  96.150964
#[45]   7.115535  32.046714  41.667936  73.094586  83.687691  58.214523


# I chose the "Pearson correlation coefficient" statistical test, followed by a linear regression

correlation_coefficient <- cor(speed, distance_to_stop)
print(paste("Pearson Correlation Coefficient:", correlation_coefficient))
#[1] "Pearson Correlation Coefficient: 0.0750818182791755"

linear_model <- lm(distance_to_stop ~ speed)
summary(linear_model)
# Call:
# lm(formula = distance_to_stop ~ speed)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -56.078 -26.605  -2.866  23.094  59.237 

# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  52.2981    11.4217   4.579 3.33e-05 ***
#   speed         0.3762     0.7213   0.522    0.604    
---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 32.15 on 48 degrees of freedom
# Multiple R-squared:  0.005637,	Adjusted R-squared:  -0.01508 
# F-statistic: 0.2721 on 1 and 48 DF,  p-value: 0.6043


# Plotting:
plot(speed, distance_to_stop, xlab = 'Speed (mph)', ylab = 'Distance to Stop (ft)', main = 'Speed vs Distance to Stop')

#making the graph more understandable to sight
plot(speed, distance_to_stop, 
     xlab = 'Speed (mph)', 
     ylab = 'Distance to Stop (ft)', 
     main = 'Speed vs Distance to Stop',
     pch = 16,
     col = gray(.0, .5))
grid()                             

abline(linear_model, col = 'red')  # Regression line

###RESULTS: 
#As we can see, the Pearson correlation coefficient value is significantly close to zero, 
#meaning that there is almost no correlation between the variables.
#Also, we can see this in the in the plotted graph with the regression line. 
#The hypothesis is not true. 
#The values of the speed of the cars aren't proportionally related to the distance it takes the cars to stop.
#To check the real correlation between these, we would have to study other variables aswell.
