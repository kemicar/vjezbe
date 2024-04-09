##Homework 2##

## I've decided to use the dataset 'quakes',primarily used to show
#location of seismic events near Fiji, to test out a statistical hypothesis

#the hypothesis I set out to test is the higher frequency of earthquakes in the 
#last decade compared to previous decades due to more frequent tectonic movement

## my null hypothesis (HO) would be: The earthquake frequency in Fiji in the last 
#decade is not higher than earthquake frequency registered in the previous decades

## I will also set an alternative hypothesis (H1): The earthquake frequency in Fiji
#in the last decade is higher than the earthquake frequency in previous decades

#* the reason I decided to use the dataset quakes is to see how simply it is to 
#* conduct a statistical test regarding data that is everchanging and also to give
#* rise to an issue that people living in Southern Hemisphere surrounded by the 
#* South Pacific Ocean deal with almost on a daily basis

#Primarily, I have to load the quakes dataset
data(quakes)

#Then, I decided to generate synthetic earthquake data for the sake of the test
# I used the function set.seed() to create random numbers that can be reproduces

set.seed(123)
#next step is creating a dataframe for the earthquake data
# I needed to create sample years from the range I was testing in my hypothesis so
# from 2000 to 2020 and also created a placeholder for the time if the earthquake 
#occured in the years sampled
quakes_data <- data.frame( year= sample (2000:2020, 1000, replace = TRUE), in_last_decade = NA)

# Aferwards I needed to mark earthquakes that occured in the last decade
quakes_data$in_last_decade <- ifelse(quakes_data$year >= 2011, 1, 0)

#I decided to generate some randomized earthquake frequencies
# whilst making an assumption that the frequencies got higher in the last decade
# for this part I came across the function rpois() which generates random numbers
#from a Poisson distribution which showes the probability of a number of independent events
quakes_data$freq <- ifelse(quakes_data$in_last_decade == 1, rpois(sum(quakes_data$in_last_decade), 
                                                                  20), rpois(sum(quakes_data$in_last_decade == 0), 10))
# I saved the data that was generated to a CSV file and also an Excel table for simpler use
write.csv(quakes_data, "earthquake_data.csv", row.names = FALSE)
# Next I loaded the saved CSV file
quakes <- read.csv("earthquake_data.csv")

#For the sake of testing the hypothesis I decided to use a chi-square test to count data
# because it is used when testing if two categorical variables are independent 
test_result <- prop.test(table(quakes$in_last_decade))

#to conclude I will print the result
print(test_result)

#the result of the chi-square test is a p-value which determines if my set hypothesis
# is correct or if the results go against it
# if the p-value is small, usually around 0.05 it would mean the HO is not correct
# if the p-value is higher than 0.05 it would mean that there is failure to reject
# the null hypothesis
# in my test, the p-value is 0.06208 meaning with the data provided I cannot reject
# the null hypothesis
# the alternative hypothesis H1 is valid because true p in not equal to 0.5 meaning
#there is a difference in frequency of earthquakes in the time set- between last and previous deacde


#other mentionable values conducted in this chi-sqaured test are x-sqaured or test statistic
#degrees of freedom, percentage of confidence interval and sample estimate(p) which shows
#the percentage of earthquakes occured in the last decade







