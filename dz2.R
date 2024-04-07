#I chose a data set "Student Admissions at UC Berkeley" and loaded it to Rstudio

data('UCBAdmissions')
View(UCBAdmissions)

#I converted the UCBAdmissions data set into a data frame called df_admissions
#to make it easier to work with and analyze the data 

df_admissions <- as.data.frame(UCBAdmissions)
View(df_admissions)

#I am interested to see if there is a correlation between rates of admission and 
#gender at US Berkeley
#to test this, I will set 2 hypotheses (null and alternative), and perform 
#chi-squared hypothesis test which evaluates whether there is a significant 
#association between two categorical variables

#the null hypothesis (H0) typically states that there is no relationship between 
#the two variables (in this case that there is no relationship between admission 
#rates and gender)
#the alternative hypothesis (H1) suggests that there is a relationship between
#those two variables

H0 <- "There is no link between admission rates and gender"
H1 <- "There is a link between admission rates and gender"

#I will now create a table which summarizes the counts for each combination of 
#admission status and gender (I need this table to conduct the chi-squared test)

admissions_table <- xtabs(Freq ~ Admit + Gender, data = df_admissions)
admissions_table

#I will now perform the chi-squared test using the table I have created

test_result <- chisq.test(admissions_table)
test_result

#results: X-squared = 91.61, df = 1, p-value < 2.2e-16
#the chisq.test() function calculates the x-squared value, degrees of freedom, 
#and p-value 

#in the end, I will create if-else function that makes a decision based on the 
#p-value (if the p-value is less than 0.05 the null hypothesis is rejected in 
#favor of the alternative hypothesis; otherwise, the null hypothesis is not
#rejected)

if(test_result$p.value < 0.05){
  print(H1)
}else{
  print(H0)
}

#conclusion: There is a link between admission rates and gender at US Berkeley
