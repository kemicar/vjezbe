#For my statsistical interpretation I've chosen the data set
#called USArrests which shows violent crime rates by US State
#it shows the number of arrests per 100 000 residents for assault, murder and
#rape in all US States and the percent of population living in urban areas is also given

#1. I will load my data using the command data() and than see my data in the table

data("USArrests")
View(USArrests)

#2. I want to save it as an object df so I can use my dataset more easily afterwards
df <- data.frame (USArrests)
View(df) #viewd my data to see if I saved it correctly

#3. Hypotheses formulation
# My Hypothesis is: The mean assault rate is higher in states where more people live in urban areas.
#That makes my null hypothesis: The mean assault rate is higher in states where more poople live in urban areas.
#My alternative hypothesis is: The mean assault rate is not higher in states where more people live in urban areas.

#Since I want to separate the States by the percentage of people living in urban areas I will calculate the 
#mean of population living in urban areas in all the States and put that as my threshold that will then separate
#the States with a lower percentage of urban poopulation of that with a higher one.

mean (df$UrbanPop)

#4. Categorizing states in the data based on population living  in urban areas.

high_UrbanPop <- df[df$UrbanPop > 65.54, "Assault"]
low_UrbanPop <- df[df$UrbanPop <= 65.54, "Assault"]

#5. I am comparing mean assaults between two groups based on urban population and conducting a t-test which is a test
#usually used to compare the means of a variable between groups.

result <- t.test (high_UrbanPop, low_UrbanPop) #t.test is a built in function in R and I'm comparing two groups of data 
#                                               so this is conducting a t-test to compare the assault rates between them


#The p-value is equal to 0.1138 which is higher than 0.05 and I cannot reject the null hypothesis, there is insufficient
#evidence to reject it.

#6. Making a box plot to visualize the assault rates in both groups.
## loading the library to open ggplot2package that has been already installed

library(ggplot2)

ggplot(df, aes(x=factor(UrbanPop>mean(UrbanPop)),y=Assault))+
  geom_boxplot()+
  labs(x = "Population Density Group", y= "Assault Rate")+
  scale_x_discrete(labels=c("Low Urban", "High Urban"))+
  theme_minimal()


















