#Hypothesis: based on the monthly totals of international airline passengers from 1949 to 1960 we can predict the monthly totals of international airline passenger for any year after 1960
#dataset: AirPassenger - monthly totals of international airline passengers from 1949 to 1960
#H0 - the observed pattern fits the given distribution
#H1 - the observed pattern does not fit the given distribution

AirPassengers
test = chisq.test(AirPassengers)
test

#the p-value is less than 0.05 therefore the null hypothesis(H0) is rejected
#conclusion: the monthly number of airline passengers are significantly not commonly distributed with a p-value = 2.2e-16 
#the pattern does not align with the predicted distribution - the hypothesis is wrong - we cannot predict how many passengers the airline will have based on how many passengers it has had in the past