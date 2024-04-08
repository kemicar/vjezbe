#Homework 2

#Data set:"Student's Sleep Data"

#In order to work with data set, it must first be loaded in the R studio (each data set has its own name)
data(sleep)
sleep
#"Student's Sleep Data" data set shows the impact of sleeping pills on the sleep of 10 participants (students)
#For each student, we know the sleep deficit/excess [extra] when they took the pills [2] and when they did not [1]
#I was curious whether soporific drugs really have an impact on sleep because I have never used them, so I decided to use the Chi-square test to check
?chisq.test
#Chisq test is a statistical test used to examine the independence between two categorical variables
#In order to perform a chisq statistical test, a hypothesis must first be formed
#Hypothesis -  an assumption or statement made as an initial assumption or prediction, which is then tested or investigated to confirm or disprove it

#Hypothesis(H0) - sleeping pills do not affect sleep outcomes
#Alternative hypothesis(H1) - sleeping pills affect sleep outcomes

#The second step in creating a chisq test, after creating hypothesis,is a contingency table - a table that shows the frequency distribution of two variables
#In this case, there are two categorical variables: taking sleeping pills (yes or no) and sleep quality among students (sleep duration)

dfsleep <- data.frame(sleep) #creating data frame
dfsleep

pills <- dfsleep$group         #extracting variables
pills
hoursofsleep <- dfsleep$extra
hoursofsleep

kontingencija <- table(pills, hoursofsleep)
kontingencija
View(kontingencija)
#Frequencies are the values we would anticipate in each cell of the contingency table if the two variables were independent

#The main step of the chisq test is the summary index that measures the difference between the actual frequencies in the contingency table and the expected frequencies
chisq_sleep <- chisq.test(kontingencija)
chisq_sleep

#Results of test: X-squared = 14, df = 16, p-value = 0.5987
#p-value represents the probability of obtaining results as extreme as or more extreme than the observed results, assuming that the null hypothesis is true
#In this test p-value is 0.5987, which means that there is not enough strong evidence to support the alternative hypothesis, i.e. the retention of the null hypothesis is supported - sleeping pills do not affect sleep outcomes






