#First i loaded my data with this command: 

data("HairEyeColor")

print(HairEyeColor)   #to see my data


#The hypothesis: there would be more individuals with brown/black hair 
#and brown eyes due to dominant genes.

#Null hypothesis: the proportions of individuals with different combinations of 
#hair color and eye color are equal, 
#and any observed differences are due to random variation.

#I did not include gender in my hypothesis



#This code will load the data set and then create a contingency 
#table showing the counts of each combination of hair and eye color. 

cont_table <- xtabs(Freq~ Hair + Eye, data = HairEyeColor)
cont_table

#The chi-square test will evaluate whether there is a significant association 
#between hair color and eye color.
chi_square_result<-chisq.test(cont_table)
chi_square_result


#RESULTS:
##The test revealed a test statistic (X-squared) of 138.29 with 9 degrees of freedom.
##The p-value associated with the test was found to be less than 2.2e-16 (essentially zero).
##Due to the extremely low p-value, we reject the null hypothesis.
##We conclude that there are certain combinations of hair and eye color that occur more 
#frequently in population.
##While the hypothesis about dominant genes affecting the prevalence of
#brown/black hair and brown eyes was not directly tested, the analysis 
#suggests that there are indeed associations between these traits, 
#which may be influenced by genetic factors among other factors.
#I supplemented my analysis by consulting various resources, including Google.

