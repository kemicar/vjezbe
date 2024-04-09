library(tidyverse)
library(ggplot2)
library(plotly)
library(datasets)
library(dplyr)
library(mlr3)
library(Hmisc)

#3. working with datasets
data(package = .packages(all.available = TRUE)) #list the data sets in all
View(iris)

#4. install package for data science
install.packages("palmerpenguins")
library(palmerpenguins)

data(package = "palmerpenguins") #to list dataset(s) available in the pack
?penguins

#5. prepare dataframe
df <- read.csv(path_to_file("penguins.csv")) #store dataset penguins 
View(df)

colsums(is.na(df)) #search for Nan values
df <- na.omit(df) #delete all Nan values
colSums(is.na(df)) #search again for Nan

View(df)

#6. data exploitation

head(df)
tail(df)

head(df, n = 2L)
head(df=, n = -10L)

names(df)
nrow(df)

tr_df <- t(df)

###TASK
#show last 7 rows in df

tail(df, n=7)

#show number of columns
ncol(df)

#7. indexing
#ALWAYS rows, columns

df$island
df$sex[2:10]
df[2]
df[3, 6]
df[1,]

###TASK
#show column with weight 
df$body_mass_g

#show column with bill lenghts from 13th to 23rd row
df$bill_length_mm[13:23]

iiii#show 4th row
df[4,]

#show 6th row with 10th column
df[6, 10]

#8. renaming
toupper(names(df))
tolower(names(df))

toupper(df$sex) #not only reader

colnames(df)[3]="bill_L" #rename column 3
names(df)

col_names<- c("species", "island", "bill_L", "bill_D", "flipper", "mass", "sex", "year")
names(df) <- col_names
names(df)

#9. descriptive statistics
summary(df)
table(df$species) #frecuency- categorical data

mean(df$bill_L)
median(df$flipper)
max(df$mass)
min(df$mass)
sd(df$mass)

###TASK
#show frecuency of data in column island
table(df$island) #frecuency- categorical data

#which is max value of flipper
max(df$flipper)

#what is min value of flipper
min(df$flipper)

#meadian of year
median(df$year)

#10. subsets
#we would like to see average mass by habitat
aggregate(df$mass, #variable of interest
          list(df$island), #condition for grouping data
          FUN = mean) #what is being calculated

#can also be written as: 
aggregate(x = mass ~ island, 
          data = df,
          FUN = mean)
#####(not working because i cannot install Hmisc package, "∼" belongs to it) 

#command table() has similar function

table(df$sex)

aggregate(x = df$sex,
          by = list(df$sex), #group by sex
          FUN = length) #number of each indiviadual in the category
?aggregate
#aggregate can be used for more conditions
aggregate(x = df$mass, 
          by = list(df$island, df$sex),
          FUN = mean)

###TASK
#calculate average flipper age by sex
aggregate(df$flipper, #variable of interest
          list(df$sex), #condition for grouping data
          FUN = mean) #what is being calculated

#calculate max mass by islands
aggregate(df$mass, #variable of interest
          list(df$island), #condition for grouping data
          FUN = max) #what is being calculated

#aggregate bill lengths by island and species
aggregate(x = df$bill_L,
          by = list(df$island, df$species), #group by 
          FUN = data.frame) 

#11. useful commands
tr_df <- t(df) #transponing
newCol<- mutate(df, #adding new column based on a condition
                mass_kg = mass/1000) #we want to convert grams to kilograms 
View(newCol)

#12. selection of certain data
#using the select() function, we can select only the elements we are interested in

#we want to select only data about bill

selected <- select(df, #from which set we select data
                   bill_L, bill_D) #which part of the data we select
View(selected)

#selecting data from to

head(df)

#selection only numerical data- from bill-mass

selected2 <- select(df,
                    bill_L:mass)
head(selected2, 3L)

###TASK
#add a new column with surface of the bill
df_2<- mutate(df, #adding new column based on a condition
                bill_S = bill_L/bill_D) #we want to convert grams to kilograms 
View(df_2)

#select last 3 columns
selected3 <- select(df_2,
                    sex, year, bill_S)
View(selected3)

#13. pipeline %>% 
#Ctrl + Shift + M (Windows)
#Shift + Cmd + M (Mac)

#concept of writing code
#enables easier connection of different steps
#resultant is better and more readeble code 

#calculate the logarithim of the number 100 to base 10
log10(100)

#PIPELINE example
100 %>% log10()

#MORE COMPLICATED example
sqrt(log(cos(sin(pi))))
pi %>% sin %>% cos %>% log %>% sqrt

###TASK
#calculate the sin of the number pi tradicionally and using the pipline
sin(pi)
pi %>% sin
pi %>% sin() #same as the one before

#write pipeline for:
sqrt(log10(100))
100 %>% log10 %>% sqrt

#pipeline and statistics

#we have a dataset penguins
#we want to group it according to species
#then we want to make statistics that will include mean, sd and max

head(df)

df %>%    #dataset
  group_by(species) %>% #group by species
  summarise(
    meanvalue = mean(mass) ,   #mean penguin mass
    stdev = sd(mass) ,    #standard deviation penguin mass
    max = max(mass))      #max penguin mass

#we want to see penguins heavier than 5Kg
#pipeline and function subset()

df %>%
  subset(mass > 5000)

###TASK
#we want to see penguins heavier than 5Kg
#calculate average mass by island (use function aggregate) (TOGETHER BOTH STEPS - PIPELINE)
df %>%
  subset(mass > 5000) %>%
  aggregate(mass ~ island, 
            FUN = mean)

####PLOTS
#1. the basic graph is a plot showing the relationship between x and y

plot(x = df$mass, y = df$flipper)

#elements we can add to plot()
plot(x = df$mass, y = df$flipper,
     main = "Mass and Flipper lenght", #title
     xlab = "Mass (g)",                #x-axis name
     ylab = "Flipper length (mm)",      #y-axis name
     pch = 16,                         #dots instead of circles
     col = gray(.0, .1))               #color: transparent gray

#make it more pretty
plot(x = df$mass, y = df$flipper,
     main = "Mass and Flipper lenght", #title
     xlab = "Mass (g)",                #x-axis name
     ylab = "Flipper length (mm)",      #y-axis name
     pch = 16,                         #dots instead of circles
     col = gray(.0, .5))               #color: darker gray gray
grid()                                 #adding the grid

#calculate regression model and add it to the grid
model <- lm(formula = mass ~ flipper,
            data = df) 
abline(model, col = "red")
########UNFINISHED

#########TASK UNDONE



#2. bar charts
ggplot(df, aes(x = species)) + #chosen data frame and axis
  geom_bar() #ggplot code needs a command part of the code

ggplot(df, aes(x = species)) +  
  geom_bar(fill = "blue", color = "red", width = 0.4) +
  ggtitle("Penguin Species") +
  xlab("Species") + 
  ylab("Number")

#if we want 0 to be aligned with the origin of the axis
ggplot(df, aes(x = species)) +  
  geom_bar(fill = "blue", color = "red", width = 0.4) +
  ggtitle("Penguin Species") +
  xlab("Species") + 
  ylab("Number") +
  scale_y_continuous(expand = c(0, 0))

###TASK 
#make a bar chart for islands
ggplot(df, aes(x = island)) + #chosen data frame and axis
  geom_bar()

#graph elements: title, axis names
ggplot(df, aes(x = species)) +  
  ggtitle("Penguins in the Islands") +
  geom_bar(fill = "purple", color = "green", width = 1) +
  xlab("Islands") + 
  ylab("Penguins")

#3. Pie charts

#make a basic pie chart

ggplot(df, aes(x="", y=sex, fill=species)) + 
  geom_bar(stat="identity", width=1)

#barplot naturally does count data
#stat = "identify", calculates the sum of y variables

ggplot(df, aes(x="", y=sex, fill=species)) + 
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) #function that circles the bar plot in ...

#we change colors by preference
ggplot(df, aes(x="", y=sex, fill=species))+
  geom_bar(stat="identity", width=1)+
  coord_polar("y", start=0)+
  scale_fill_brewer(palette="Greens")+
  theme_minimal()

#Task: search for a new color palette:
ggplot(df, aes(x="", y=sex, fill=species))+
  geom_bar(stat="identity", width=1)+
  coord_polar("y", start=0)+
  scale_fill_brewer(palette="PiYG")+
  theme_minimal()

#Another example:
ggplot(df, aes(x="", y=sex, fill=species))+
  geom_bar(stat="identity", width=1)+
  coord_polar("y", start=0)+
  scale_fill_brewer(palette="PuRd")+
  theme_minimal()

#So that we don´t have to run the whole code every time, we can save it.
#This way it is easier to add new elements (ex: colors)

#Write the code at the beginning:
pie <- ggplot(df, aes(x="", y=sex, fill=species)) + 
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)
pie

blue_pie <- pie +
  scale_fill_brewer(palette="Blues")+
  theme_minimal()
blue_pie

#ADVANCED CHARTS:
#we take data from built-in sets
#data from the BOD set

?BOD
View(BOD)

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_point(size=5, color = "Blue") +
  geom_line(color = "Red")

#...penguins?
ggplot(df,aes(x = mass, y = flipper)) +
  geom_point(size=5, color = "Blue") +
  geom_line(color = "Red")

#...subsets? (it chooses part of the data set)
ggplot(subset(df, species == "Chinstrap"),aes(x = mass, y = flipper)) +
  geom_point(size=5, color = "Blue") +
  geom_line(color = "Red")

#Data from the CO2 set

?CO2
View(CO2)

CO2 %>%
  ggplot(aes(conc, uptake,
             color = Treatment)) +
  geom_point(size=3, alpha=.5) +
  geom_smooth(method=lm, se = F) +
  facet_wrap(~Type)+ 
  labs(title="conc")+
  theme_bw()

?geom_smooth #google to know what it is
?facet_wrap

###TASK
#penguins.. x:mass, y:flipper, color by sex
#make 3 graphs based on islands

df %>%
  ggplot(aes(mass, flipper,
             color = sex)) +
  geom_point(size=3, alpha=.5) +
  geom_smooth(method=lm, se = F) +
  facet_wrap(~island)+ 
  labs(title="Penguins")+
  theme_bw()


###
CO2 %>%
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha=.5,
             aes(size=conc, color=Plant)) +
  facet_wrap(~Type)+ 
  coord_flip()+
  theme_bw()+
  labs(title="Treatment Effects on Uptake with Plant Variation")

###TASK
#...penguins?
# x=sex, y=flipper, size and color of dots
#conditions: mass and species
#graphs by islands

df %>%
  ggplot(aes(sex, flipper))+
  geom_boxplot()+
  geom_point(alpha=.5,
             aes(size=mass, color=species)) +
  facet_wrap(~island)+ 
  coord_flip()+
  theme_bw()+
  labs(title="Penguins")

###
?mpg
View(mpg)

mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(displ, cty))+
  geom_point(aes(color=drv,
                 size=trans), alpha=.3,)+
  geom_smooth(method=lm, se = F)+
  facet_wrap(~year, nrow=1)+
  theme_bw()+
  labs(x="x", y="y", title="City MPG vs. Engine Displacement by Drive Trains")

###TASK
#...penguins by your own choice
df %>%
  filter(flipper > 180) %>%
  ggplot(aes(year, mass))+
  geom_point(aes(color=island,
                 size=sex), alpha=.6,)+
  geom_smooth(method=lm, se = F)+
  facet_wrap(~species, nrow=1)+
  theme_bw()+
  labs(x="x", y="y", title="Penguins")



#####INSTALL MORE PACKAGES:

install.packages("ggfortify")
install.packages("palmerpenguins")
install.packages("devtools")
#install.packages("vqv/ggbiplot")
#
install.packages("ggbiplot")
#
install.packages("rpart.plot")
install.packages("caret")
install.packages("ggpubr")
install.packages("GGally")

library("GGally")
library("tidyverse")
library("ggplot2")
library("plotly")
library("dplyr")
library("Hmisc")
library(ggfortify)
library(palmerpenguins)
library(devtools)
library(ggbiplot)
library(dplyr)
library(tidyr)
library(rpart)
library(rpart.plot)
library(caret)
library(datasets)
library(ggpubr)
library("datasets")

#we are still on our penguins df dataset

#STATISTICAL TESTS:

###T-test (two-samples)###

#standard two-sample Student's t-test assumes that:
#datasets are normally distributed
#datasets have equal variance

#is there a difference in fin length between male and female
#null hypothesis is that means that both groups are equal

#first you should always familiarize yourself with data

View(df)

#before implementing the t-test, we are interested in the data distribution
#one of the ways to check data distribution is to draw a Histogram

#we drew a histogram by gender for fin length to see the distribution

ggplot(df, aes(x = flipper)) +
  geom_histogram(binwidth = 10, fill = "Blue", color = "White") +
  facet_wrap(~ sex, ncol = 1)

#box plot shows the distribution of that meedian

#ggplot shows the distribution of that median

ggplot(df, aes(x = sex, y = flipper, color = sex)) + 
  geom_boxplot()

#calculation of mean values

aggregate(df$flipper,
          by = list(df$sex),
          FUN = mean)

#conducing statistical tests
t.test(flipper ~ sex, data = df)

#INTERPRETATION OF RESULTS:
#first row: which test was performed
#second line: which data set is used
#third row: t-test statistics, degrees of freedom, p-values
#fourth row: the mean values of the two groups are not equal to 0 (if they .....?)
#fifth row: 95% confidence interval
#then follow the mean values calculated for each group





#?




#according to the island they live on
#given that we have more than two islands, that is, two samples:
#we need to perform a one-way ANOVA analysis

#Analysis Assumptions:
#datasets are normally distributed
#dtasets have equal variance

#box plot:

ggplot(df, aes(x = island, y = bill_L,
               color = island)) +
  geom_boxplot() +
  theme_bw() + 
  coord_flip()

#mean values
aggregate(df$bill_L, by = list(df$island), FUN =mean)

#let's do an analysis of variance (anova),
#and save it as an R object bill_oa

bill_oa <- aov(formula = bill_L ~ island,
               data = df)

#we got the data (degrees of freedom,
#sum of squares, what data was used)

bill_oa

#for the rest of the statistical variables we calculate de...?

summary(bill_oa)

#INTERPRETATION OF RESULTS:
#what test was performed
#what data is used
#difference between group mean values,
#confidence intervals and p value

#ANOVA is a "special" type of regression,
#so we can check our results with LINEEAR REGRESSION

bill_oa_lm <- lm(formula = bill_L ~ island,
                 data=df)
summary(bill_oa_lm)


#?


#graph (1º way):
ggplot(df) +
  aes(x = species, fill = island) + 
  geom_bar()

#graph (2º way):
ggplot(df) +
  aes(x = species, fill = island) + 
  geom_bar(position = "dodge")


#chi sq test
test <- chisq.test(table(df$species,df$island))
test

#TASK
#we want to know the difference by sex per islands

######


### Mann-Whitney U test ###

#bill depth is same in both sexes

#graph
ggplot(df, aes(x = sex, y = bill_D, fill = sex)) +
  stat_boxplot(geom = "errorbar", width = 0.5) +
  geom_boxplot(fill = "light blue") + 
  stat_summary(fun = mean, geom = "point", 
               shape = 10, size = 3.5, color = "Black") +
  ggtitle("Boxplot of bill depth") +
  theme_bw() + theme(legend.position = "none")

#test
res <- wilcox.test(bill_D ~ sex,
                   data = df,
                   exact = FALSE)
res

?wilcox.test

#INTERPRETATION OF RESULTS:
#p-value is less than the significance level, we reject the ....?
#we have evidence to suggest that there is a significant difference....????
#distribution of bill_D between the two groups defined by ......?????



###TASK
#is there a difference in flipper length?
#by sex (and graph)

#####



###CORRELATION###
heatmap(df)

#Filter numeric variables
numeric_vars <- sapply(df, is.numeric)
penguins_numeric <- df[, numeric_vars]
#compute correlation matrix
cor_matrix <- cor(penguins_numeric)
#convert correlation matrix to long format
cor_df <- reshape2::melt(cor_matrix)
#create heatmap using ggplot2
ggplot(cor_df, aes(Var1, Var2, fill = value)) +
  geom_tile() + 
  scale_fill_gradient2(low = "Blue", mid = "White", 
                       high = "Red", midpoint = 0,
                       limits = c(-1, 1),
                       name = "correlation") +
  theme_minimal() +
  labs(title = "Correlation Matrix Heatmap")

#PEARSON
cor(df$mass, df$flipper, method = "pearson")
#INTERPREETATION:
#correlation coefficient
#correlation ranges from -1 to 1
#The direction of the relationship between the 2 variables
#The strength of the relationship between the 2 variable.

#SPEARMAN
cor(df$mass, df$flipper, method = "spearman")

##LINEAR REGRESSION##
#data distribution plots

hist(df$mass)
hist(df$flipper)
plot(flipper ~ mass, data = df)

#LINEAR MODELS
lm_penguins1 <- lm(flipper ~ mass, data = df)
summary(lm_penguins1)

#we got very small numbers and the solution would be scaling

#SCALING
scale_mass <- scale(df$mass)
scale_flipper <- scale(df$flipper)
df2 <- data.frame(scale_mass, scale_flipper)
View(df2)
hist(df2$scale_mass)
hist(df2$scale_flipper)
hist(df$mass)

plot(scale_flipper ~ scale_mass, data = df2)
lm_sc_penguins2 <- lm(scale_flipper ~ scale_mass, data = df2)
summary(lm_sc_penguins2)

#for every 1% of the length of the fin,
#the mass increases by 873% (besides scaling, 
#we should have converted mm to m, and g to kg)

###TASK:
#make a liner regression for bill and plot as well
######



##Multilinear regression#

hist(df$mass)
hist(df$flipper)
hist(df$bill_L)

lm_penguins_3 <- lm(mass ~
                      flipper +
                      bill_L,
                    data = df)
summary(lm_penguins_3)

#TASK:
#make lm model for species GENTOO using subset command

GT <- subset(df, df$species == "Gentoo")

GT$mass <- scale(GT$mass)
GT$flipper <- scale(GT$flipper)
GT$bill_L <- scale(GT$bill_L)

lm_adelci <- lm(mass~
                  flipper +
                  bill_L,
                data = GT)
summary(lm_adelci)

