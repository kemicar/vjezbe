# Loading the datasets package
library(datasets)

# Loading the esoph dataset
data(esoph)

# esoph dataset contains data from a study of esophageal cancer
# It contains records for 88 age/alcohol/tobacco combinations

# I came up with a null hypothesis
# H0: There is no association between alcohol consumption and the likelihood of developing esophageal cancer

# To test the H0, I used a chi-square test
# This test will help to determine if there is a significant association between alcohol consumption (alcgp) and the likelihood of developing esophageal cancer (ncases)
# chisq.test is a command to execute a chi-square test in R

# Performing the chi-square test
result <- chisq.test(esoph$alcgp, esoph$ncases)

# Printing the result
print(result)

# I got a p-value which is a lot higher than 0.05
# p-value=0.7966
# This means that I cant reject the null hypothesis - not enough evidence
# There is no significant association between alcohol consumption and the likelihood of developing esophageal cancer