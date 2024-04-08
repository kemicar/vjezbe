#Our task this time was to pick one of available datasets, develop a hypothesis about the data contained
#within and test this hypothesis via a statistical test which we deem appropriate.
#We chose the dataset named "ToothGrowth". 
#This dataset contains data regarding length of odontoblasts (cells responsible for tooth growth) in 60 guinea pigs.
#Each animal received one of three dose levels of vitamin C (0.5, 1, and 2 mg/day) by one of two delivery methods,
#orange juice or ascorbic acid (a form of vitamin C and coded as VC).

#To begin with, we loaded the data as a new dataframe called df.
df<-data.frame(ToothGrowth)
df
#Next, we decided to get a general sense of the data by plotting it as a graph.
#The first graph we made is the box plot of tooth length for every animal. The values appear to be relatively evenly distributed in range 5-35.
boxplot(df$len, data = df, na.action = NULL, horizontal = FALSE, drop = FALSE, sep = ".", lex.order = FALSE)
#Next, we made a box plot of teeth length over supplement type. It appears that median values and intequartile ranges of orange juice 
#and ascorbic acid differ somewhat. However, the data in ascorbic acid group appears to have more cases extreme values.
?boxplot
boxplot(df$len~df$supp, data = df, na.action = NULL, horizontal = FALSE, drop = FALSE, sep = ".", lex.order = FALSE)
#We also made a box plot for teeth length over administered dose. In this case, 
#mean values, interquartile ranges and extreme values differed significantly.
#Highest values appear to be concentrated in 2 mg/day group, followed closely by 1 mg/day group.
#The lowest median values appear to be those from o.5 mg/day, although the most extreme value in this group is larger than 1 mg/day group mean.
boxplot(df$len~df$dose, data = df, na.action = NULL, horizontal = FALSE, drop = FALSE, sep = ".", lex.order = FALSE)
#Finally, we made a histogram of tooth length and it appears to somewhat resemble normal distribution,
#although to be completely shure we will have to conduct tests to confirm this. 
hist(df[,1], col='steelblue', main='Teeth_length')
#Based on this data we can propose 2 hypotheses. Firstly, we propose that the effect of orange juice on tooth growth
# will be greater than that of aspartic acid. Secondly, we propose that there is a positive correlation
# between teeth length and the vitamin c dose.
# We can summarise these two hypotheses into statistically testable forms:
#1.) There is a statistically significant difference between 
#the means of animal groups that were administered either orange juice or ascorbic acid.
#2.) There is a statistically significant difference between  
#the means of animal groups that were administered 0,1 or 2 mg/day of vitamin c.

#Lets start with the first hypothesis. To test this, we will have to perform a t-test on our data.
#However, since t-test assumes that data plots for both of our samples resemble a normal distribution,
#we will have to first test the normalcy of our data via several tests.
#Firstly, we will make a new function and use it to separate our data into two new vectors with respect to
#supplement type.
vecf<-function(x) {
  vecOJ<-c()
  vecVC<-c()
  for (a in (1:nrow(x))) {
    if (x[a,2]=="OJ") {
      vecOJ<-append(vecOJ,x[a,1])
    }
    else if (x[a,2]=="VC") {
      vecVC<-append(vecVC,x[a,1])
    }
  }
  rez<-data.frame(vecOJ,vecVC)
  return(rez)
}
rez<-vecf(df)
vecOJ <- rez[,1]
vecVC <- rez[,2]
vecOJ
vecVC
#Now that we have our data nice and separate, we can check the normalcy of our data.
#create histogram, Q-Q and for both datasets
#We will begin by creating histograms for both of our sets of data.
hist(vecOJ, col='steelblue', main='OJ')
hist(vecVC, col='steelblue', main='VC')
#We can immediately notice that while VC (vitamin c) data somewhat resembles a normal distribution,
#OJ (orange juice) data clearly is clearly quite far from ideal.

#Next, we can draw a Q-Q plot for both sets of data and compare them to the Q-Q plot for normal distribution.
#This plot compares the quantiles of our data to quantiles of a normal distirbution and, if they match,
#the plot should mostly reside on the straight line.
qqnorm(vecOJ, main='OJ')
qqline(vecOJ)

qqnorm(vecVC, main='VC')
qqline(vecVC)
#Again, while VC plot mostly follows the normal distribution pattern, OJ plot clearly strays from the ideal.

#To get a precise and formal measurement of normalcy of our data, we can perform a normalcy tests.
#One of the tests we can perform is the Shapiro-Wilk normalcy test.
#The null hypothesis in this test is that the distribution of a set of data matches the normall distribution,
#while the alternative hypothesis states that it does not.
shapiro.test(vecOJ)
shapiro.test(vecVC)
#While the p value for VC is greater than 0.05, therefor meaning we can accept the null hypothesis,
#the p value for OJ data is smaller than 0.05, meaning we can reject the null hypothesis.

#A similar test we can perform is Anderson-Darling normalcy test. 
#The results of the test appear to be quite similar to those of Shapiro-Wilk test
install.packages('nortest')
library(nortest)
ad.test(vecOJ)
ad.test(vecVC)

#So what does all of this tell us.
#While we can confidently state that the data distribution for the VC is sufficiently similar 
#to a normal distribution, the same is not true for the OJ distribution.


#Another important factor for the t-test is the homogeneity of variance,
#meaning weather or not the variance of both of our samples is roughly similar.
#We can test this using the Levene's test for equality of variance, 
#where the null hypothesis is that there is no statistically significant difference between the variances.
install.packages("car")
library(car)
leveneTest(len~as.factor(supp), data=df)
#The resulting p value is greater than 0.05, meaning that there isn't sufficient evidence to reject the null hypothesis.
#Therefore, there is no significant difference between the variances.

#So what does all of this tell us.
#While we can confidently state that the data distribution for the VC is sufficiently similar 
#to a normal distribution, the same is not true for the OJ distribution.
#However, at least their variances differ significantly.
#Due to this, we can't compare these samples via a t-test. Instead, we will have to use the one-way anova test,
#since this test is somewhat capable of comparing samples with differing distributions and variances.


#We preform the one-way anova test by defining the data we want to analyse 
#as a function of column 'len' over column 'supp' from our data frame.
#We can also specify that the two samples do not have an equal variance.
ano1<-aov(len~as.factor(supp),data = df)
summary(ano1)
#When we perform the test we get a p value of 0.0604, which is greater than alpha value of 0.05.
#Therefore, we failed to reject the null hypothesis.
#What do these results tell us? Well, it obviously means that the differences between teeth length groups based on supplement type
#are likely due to pure chance. This means that we should expect similar results for teeth length regardless if
#our guinea pigs get vitamin C from orange juice or ascorbic acid supplements.

#We will now test the second hypothesis. Since we will now be dealing with multiple samples (in this case 3),
#we will be conducting a one-way anova test. This test is used to examine if means of 3 or more groups are significantly different.
#Firstly we will repeat the same normality tests we conducted for previous samples by dividing the samples into three seperate vectors.

vecs<-function(x) {
  vec5<-c()
  vec1<-c()
  vec2<-c()
  for (a in (1:nrow(x))) {
    if (x[a,3]==0.5) {
      vec5<-append(vec5,x[a,1])
    }
    else if (x[a,3]==1.0) {
      vec1<-append(vec1,x[a,1])
    }
    else if (x[a,3]==2.0) {
      vec2<-append(vec2,x[a,1])
    }
  }
  rez<-data.frame(vec5,vec1,vec2)
  return(rez)
}
rez2<-vecs(df)
rez2
vec5 <- rez2[,1]
vec1 <- rez2[,2]
vec2 <- rez2[,3]
vec5 
vec1 
vec2 
#Then we make the histograms
hist(vec5, col='steelblue', main='0.5')
hist(vec1, col='steelblue', main='1.0')
hist(vec2, col='steelblue', main='2.0')
#And the Q-Q plots
qqnorm(vec5, main='0.5')
qqline(vec5)

qqnorm(vec1, main='1.0')
qqline(vec1)

qqnorm(vec2, main='2.0')
qqline(vec2)

#And the Shapiro-Wilk test
shapiro.test(vec5)
shapiro.test(vec1)
shapiro.test(vec2)

#And, finally, Anderson-Darling test
ad.test(vec5)
ad.test(vec1)
ad.test(vec2)

#The results of all of these tests show that all three samples follow a pattern of normal distribution.
#This means that our results will likely be more accurate than the results for our previous hypothesis

#To test the homogeneity of variances of our samples, we will conduct the Levene test. 
leveneTest(len~as.factor(dose), data=df)
#The resulting p value is greater than 0.05, meaning that we cannot reject 
#the null hypothesis that the variances are the same. 
#There is enough evidence to verify that the second assumption 
#of the one-way anova test is justified



#Now we can conduct a one-way anova test.
#We will describe our data as a function of column 'len' over column 'dose'
ano2<-aov(len~as.factor(dose),data = df)
summary(ano2)
#The resulting p value is 9,53e-16, which is definitely smaller than 0.05.
#Therefore, we can reject the null hypothesis and accept the alternative hypothesis, meaning that  the mean of 
#at least one of the groups is statistically significant from the rest.
#With these results we can safely conclude that the dosage of vitamin c supplement impacts the teeth length of 
#guinea pigs. 

#In conclusion, this data and test results demonstrate that, on average, the effects of orange juice and ascorbic acid
#on teeth growth in guinea pigs are relatively similar. It should be noted, however, that our test didn't
#explain the greater variance in data and more extreme minimum and maximum values for vitamin c group,
#indicating a greater variation in response in this group.
#On the other hand, we have clearly demonstrated a positive correlation between teeth length and dosage.
