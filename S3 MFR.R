### S3 MIRIAN FELICES ###
# equally ==
# not equaly !=
# less than <
# greater than >
# greater than or equal to >=
# = means the same as <-


## 1. set working directory
## 2. install packages
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("plotly")
install.packages("datasets")
install.packages("dplyr")
install.packages("mlr3")
install.packages("Hmisc")

library(tidyverse)
library(ggplot2)
library(plotly)
library(datasets)
library(dplyr)
library(mlr3)
library(Hmisc)

# 3. Working with datasets
data(package = .packages(all.available = TRUE))
#list the data sets in all
View(iris)

# 4. Install package for dtaa sciencwe
install.packages("palmerpenguins")
library(palmerpenguins)
#to list this dataset:
data(package='palmerpenguins')
?penguins

# 5. Prepare dataframe
df<-read_csv(path_to_file("penguins.csv"))
View(df)

colSums(is.na(df)) #search for Nan values
df <- na.omit(df) #delete all Nan values
colSums(is.na(df)) #search again for Nan

View(df)

#6. data exploration
head(df)
tail(df)

head(df, n=2L) #we can see the desired number of rows
head(df, n=-10L)

names(df)
nrow(df)

tr_df <- t(df)
View(tr_df)

### TASK
#show last 7 rows in df
tail(df, n=7)
#show the number of columns
ncol(df)

# 7. Indexing
#ALWAYS rows, columns
df$island
df$sex [2:10] #[from row 2 to row 10]
df[2] #without comma is a column. it shows the second column
df[3,6]
df[1,] #with comma is a row. it shows the first row

#TASK
#show column with weight
df[6] #or 
df$body_mass_g
#show column with bill length from 13th to 23rd row
df$bill_length_mm[1:23] #como hablamos de una columna, no hace falta poner comas
#show 4th row
df[4,]
#show 6th row with 8th column
df[6,8]

#8. Renaming
toupper(names(df))
tolower(names(df))

toupper(df$sex) #not only header

colnames(df)[3]="bill_L" #rename column 3
names(df)

col_names <- c("species", "island", "bill_L", "bill_D", "flipper", "masss", "sex", "year")

names(df) <- col_names
view(df)


# 9. descriptive statistics
summary(df)
table(df$species) #frequency-categorical data

mean(df$bill_L)
median(df$flipper)
max(df$masss)
min(df$masss)
sd(df$masss)

#TASK
#show frequency of data in column island
table(df$island)
#which is max value of flipper
max(df$flipper)
#what is min value of flipper
min(df$flipper)
# median of year 
median(df$year)

# 10. subsets
#we would like to see average mass by habitat
aggregate(df$masss, #variable of interest
          list(df$island), #condition for grouping data
          FUN=mean) #what is being calculated
          
#it can be written also as:
aggregate(x=masss~island,
          data=df,
          FUN=mean)
          
#command table () has a similar function
table(df$sex)

aggregate(x=df$sex,
          by=list(df$sex), #group by sex
          FUN=length) #number of each individual in the category
#aggregate can be used for more conditions
aggregate(x=df$masss,
          by=list(df$island, df$sex),
          FUN=mean)
#TASK
#calculate the average flipper length by sex
aggregate(x=df$flipper,
          list(df$sex),
          FUN=mean)
#calculate max masss by islands
aggregate(x=df$masss,
          by=list(df$island),
          FUN=max)
#aggregate bill length by island and species
aggregate(x=df$bill_L,
          by=list(df$island, df$species),
          FUN=data.frame)

# 11.useful commands
tr_df <- t(df) #transponing
newCol <- mutate(df,#adding new column based on a condition
                mass_kg = masss/1000 ) #we want to convert grams to kilograms
View(newCol)

# 12.selection of certain data
#using the select () function, we can select only the elements we are interested in
#we want to select only data about bill
selected <- select(df,
                   bill_L, bill_D)
view(selected)
#selecting data from to
head(df)
#selection only numerical data- from bill-mass
selected2 <- select(df,
                    bill_L:masss)
head(selected2,3L)

#TASK
#add a new column with surface of the bill
newColsurface <- mutate(df,
                 surface = bill_L*bill_D )
view(newColsurface)
#select last 3 columns
selected3 <- select(df,
                   masss,sex,year )
view(selected3)

# 13. pipeline %>%
#Shift + Cmd + M (Mac)

#concept of writing code
#enables easier connection of different steps
#results is better and more readable code
  
#calculate the logarithm of the number 100 to base 10
100 %>% log10()

#more complicated example:
sqrt(log(cos(sin(pi))))
pi %>% sin %>% cos %>% log %>% sqrt

#TASK
#calculate the sin of the number pi tradicionally and using the pipeline
#tradicionally:
sin(pi)
#with pipeline:
pi %>% sin()
#write the pipeline for:
sqrt(log10(100))
#done it:
100 %>% log10 %>% sqrt

#pipeline and statistics

#we have dataset penguins
#we want to group it according to species
#then we want to make statistics that will include mean, sd and max

head(df)

df %>% #dataset
  group_by(species) %>%  #group by species
  summarise(
    a=mean(masss), #mean penguin mass
    stdev=sd(masss), #stdev penguin mass
    max=max(masss) #max penguin mass
  )

#we want to see penguins heavier than 5kg
#pipeline and function subset()

df %>%  
  subset(masss>5000)

#TASK
#we want to see penguins heavier than 5kg and calculate average mass by island (use function aggregate)
df %>%  
  subset(masss>5000) %>% 
  aggregate(masss ~ island, 
            FUN=mean) 

#PLOTS
# 1. the basic graph is a plot showing the relationship between
plot(x=df$masss,y=df$flipper)
#elements we can add to plot ()
plot(x=df$masss,y=df$flipper,
     main='Mass and flipper length', #title
     xlab='Mass (g)', #x-axis name
     ylab='Flipper length (mm)', #y-axis name
     col=gray(.0,.1)) #color:transparent

#make it more pretty
plot(x=df$masss,y=df$flipper,
     main='Mass and flipper length', 
     xlab='Mass (g)',
     ylab='Flipper length (mm)',
     pch=16, #dots instead of cicles
     col=gray(.0,.1)
     )
grid() #adding the grid


#calculate regression model and add it to the grid
model <- lm(formula=masss~flipper,
            data=df)
abline(m,col=)            #INCOMPLETAAAA MAÑANA SEGUIMOS HACIÉNDOLA
view(df)

#2. bar charts
ggplot(df, aes(x=species)) + #chosen data frame and axis
  geom_bar() #ggplot code needs a command part of the code

#now we make it more pretty
ggplot(df, aes(x=species)) +
  geom_bar(fill='blue', color='red', width=0.4) +
  ggtitle("Penguin species") +
  xlab("Species")+
  ylab("Number")
  
#if we want 0 to be aligned with the origin of the axis
ggplot(df, aes(x=species)) +
  geom_bar(fill='blue', color='red', width=0.4) +
  ggtitle("Penguin species") +
   xlab("Species")+
  ylab("Number") +
  scale_y_continuous(expand=c(0,0))

#TASK
#make bar chart for islands
#graph elements: title, axis names
#purple color with green borders, cloumn width 1
ggplot(df, aes(x=island)) +
  geom_bar(fill='purple', color='green', width=1) +
  ggtitle("Penguin Islands") +
  xlab("Islands") +
  ylab("Number")

#3. pie charts
ggplot(df, aes(x="", y=sex, fill=species)) +
  geom_bar(stat="identity", width=1)

#barplot naturally does count data
#stat = "identity" calculates the sum of y varibales

ggplot(df, aes(x="", y=sex, fill=species))+
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) #function that circles the bar plot into a pie chart

#we change colors by preference
ggplot(df, aes(x="", y=sex, fill=species))+
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  scale_fill_brewer(palette = "PuBu") #look for the color code in https://rstudio-pubs-static.s3.amazonaws.com/5312_98fc1aba2d5740dd849a5ab797cc2c8d.html
  theme_minimal()

#so that we don't have to run the code every time, save the graph as an R-object
#it is algo easier to add elements (color ans similar) to 
#write the code at the beginning
pie <- ggplot(df, aes(x="", y=sex, fill=species))+
    geom_bar(stat="identity", width=1) +
    coord_polar("y", start=0) 
pie
  
blue_pie <- pie +
  scale_fill_brewer(palette="PuBuGn") +
  theme_minimal()
blue_pie
#TASK
#make pie chart with data by your own choice
#it has to have all of the above elements
#you choose your own graph design
#ADVANCeD CHARTS
pie_task <- ggplot(df, aes(x="", y=masss, fill=species))+
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) 

colored_pie_task <- pie_task +
  scale_fill_brewer(palette="PuBu") +
  theme_minimal()

colored_pie_task

#we take data from built-in sets
#data from the BOD set
?BOD
View(BOD)  

ggplot(BOD, aes(x=Time,y=demand)) +
  geom_point(size=5, color="blue") + 
  geom_line(color="red")

#...penguins?
ggplot(df,aes(x=masss,y=flipper)) +
  geom_point(size=5, color="lightblue") +
  geom_line(color="purple")

#...subset?
ggplot(subset(df,species=="Chinstrap"), aes(x=masss,y=flipper)) +
  geom_point(size=5, color="lightgreen") +
  geom_line(color="orange")

#data from the CO2 set
?CO2
view(CO2)

CO2 %>% 
  ggplot(aes(conc,uptake,
             color=Treatment)) +
  geom_point(size=3, alpha=.5) +
  geom_smooth(method=lm,se=F) +
  facet_wrap(~Type) +
  labs(title='Conc') +
  theme_bw()

?geom_smooth
?facet_wrap

#TASK
#penguins...x=mass,y=flipper, color by sex
#make 3 graphs based on islands
df %>% 
  ggplot(aes(x=masss,y=flipper,
             color=sex)) +
  geom_point(size=3, alpha=.5) +
  geom_smooth(method=lm,se=F) +
  facet_wrap(~island) +
  labs(title='Penguins') +
  theme_bw()

###
CO2 %>% 
  ggplot(aes(Treatment,uptake))+
  geom_boxplot() +
  geom_point(alpha=.5,
             aes(size=conc, color=Plant)) +
  facet_wrap(~Type) +
  coord_flip() +
  theme_bw() +
  labs(title='Treatment Effects on uptake with Plant Variation')

#TASK
#...penguins?
#x=sex,y=flipper, size and color of dots
#conditions: mass and species
#graphs by islands
df %>% 
  ggplot(aes(sex,flipper))+
  geom_boxplot() +
  geom_point(alpha=.5,
             aes(size=masss, color=species)) +
  facet_wrap(~island) +
  coord_flip() +
  theme_bw() +
  labs(title='Penguin flipper length on sex with species and habitats')

###
?mpg
view(mpg)

mpg %>% 
  filter(cty<25) %>% 
  ggplot(aes(displ,cty)) +
  geom_point(aes(color=drv,
                 size=trans), alpha=.3) +
  geom_smooth(method=lm, se=F) +
  facet_wrap(~year,nrow=1) +
  theme_bw() +
  labs(x='x',y='y',
       title = "City MPG vs Engine Displacement by Drive Train")

#TASK
#... penguins by your own choice
df %>% 
  filter(flipper<210) %>% 
  ggplot(aes(species,year)) +
  geom_point(aes(color=sex,
                 size=masss), alpha=.3) +
  geom_smooth(method=lm, se=F) +
  facet_wrap(~island,nrow=1) +
  theme_bw() +
  labs(x='x',y='y',
       title = "Penguins")

#STATISTICS
install.packages("ggfortify")
install.packages("palmerpenguins")
install.packages("devtools")
install.packages("ggbiplot")
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
library("ggfortify")
library("palmerpenguins")
library("devtools")
library("ggbiplot")
library("dplyr")
library("tidyr")
library("rpart")
library("rpart.plot")
library("caret")
library("datasets")
library("ggpubr")
library(datasets)

#principes of statistics:
# (1) make a graph according to the data
# (2) make a model
# (3) check your assumptions
# (4) interpret the model
# (5) redraw the graph and model

# we are still on our penguins dataset df

### T-test (two samples) ###
#standard two-sample student's T-test assumes that:
# datasets are normally distributed
# datasets have equal variance

view(df)

#before implementing the t-test, we are interested in the data distribution
#one of the ways to check data distribution is to draw a histogram

#we drew a histogram by gender for fin length to see the distribution

ggplot(df,aes(x=flipper)) +
  geom_histogram(bindwidth=10, fill="blue", color="white") +
  facet_wrap(~sex,ncol=1)
#box plot shows the distribution of that median
ggplot(df,aes(x=sex, y=flipper, color=sex)) +
  geom_boxplot()

#calculation of mean values
aggregate(df$flipper,
          by=list(df$sex),
          FUN=mean)

#conducting a statistical test
t.test(flipper~sex,data=df)

#INTERPRETATION OF TEST RESULTS:
#first row: which test was performed
#second line: which data set is used
#third row: t-test statistics, degrees of freedom, p-values
#fourth row: the mean values of the two groups are noe equal to 0
#fifth row: 95% confidence interval
#then follow the mean values calculated for each group

#TASK
#do ttest and graph for mass per sex
t.test(masss~sex,data=df)

##One-way ANOVA##

#we want to know the difference in the lenth of penguins beaks
#according to the island they live on
#given that we have more than two islands, that is,
#two sampples, we need to perform a one-way ANOVA analysis

#analysis assumptions:
#datasets are normally distributed
#datasets have equal variance

#box plot

ggplot(df,aes(x=island,y=bill_L,
              color=island)) +
  geom_boxplot() +
  theme_bw() +
  coord_flip()

#mean values

aggregate(df$bill_L, by=list(df$island), FUN=mean)

#let's do an analysis of variance (anova) and save it as an R object bill_oa
#ANOVA is a "special" type or regression
#so we can check our results with LINEAR REGRESSION
bill_oa_lm <- lm(formula=bill_L~island,
                 data=df)
summary(bill_oa_lm)

#chi-squared test
#we ant to see if the species has an influence on the coice of inhanitans (islands)
#let's make a matrix
table(df$species,df$island)

#graph (1st way)
ggplot(df) +
  aes(x=species, fill=island) +
  geom_bar()

#2nd way
ggplot(df) +
  aes(x=species, fill=island) +
  geom_bar(position="dodge")

#chi sq test
test <- chisq.test(table(df$species,df$island))
test

#TASK
#we want to know difference by sex per islands
test1 <- chisq.test(table(df$sex,df$island))
test1

###Mann-Whitney U test ###
#bill depth is same in both sexes
#graph
ggplot(df,aes(x=sex,y=bill_D,fill=sex)) +
  stat_boxplot(geom="errorbar", width=0.5) +
  geom_boxplot(fill="lightblue") +
  stat_summary(fun=mean, geom="point", 
               shape =10, size= 3.5, color="darkgreen") +
  ggtitle("Boxplot of bill depth") +
  theme_bw() + theme(legend.position = "none")

#test
res <- wilcox.test(bill_D~sex,
                   data=df,
                   exact=FALSE)
res

#TASK
#is there a difference in flipper length by sex (and graph)
ggplot(df,aes(x=sex,y=flipper,fill=sex)) +
  stat_boxplot(geom="errorbar", width=0.5) +
  geom_boxplot(fill="lightblue") +
  stat_summary(fun=mean, geom="point", 
               shape =10, size= 3.5, color="darkgreen") +
  ggtitle("Flipper length by sex") +
  theme_bw() + theme(legend.position = "none")

res1 <- wilcox.test(flipper~sex,
                   data=df,
                   exact=FALSE)
res1

#CORRELATION
heatmap(df)
#da error('x' must be a numeric matrix), así que hacemos lo siguiente:
#Filter numeric variables
numeric_vars <- sapply(df,is.numeric)
penguins_numeric <- df[, numeric_vars]
#compute correlations matrix
cor_matrix <- cor(penguins_numeric)
#convert correlation matrix to long format
cor_df <- reshape2::melt(cor_matrix)
#create heatmap using ggplot2
ggplot(cor_df, aes(Var1, Var2, fill=value)) +
  geom_tile() +
  scale_fill_gradient2(low="blue", mid="white", 
                       high= "red", midpoint=0,
                       limits=c(-1,1),
                       name="correlation")+
  theme_minimal() +
  labs(title="Correlation Matrix Heatmap")

#pearson
cor(df$masss,df$flipper, method="pearson")

#spearman
cor(df$masss,df$flipper, method="spearman")

#linear regression
#data distribution plots

hist(df$masss)
hist(df$flipper)
plot(flipper~masss, data=df)

#linear models
lm_penguins1 <- lm(flipper~masss, data=df)
summary(lm_penguins1)

#we got very small numbers and the solution
#would be scaling
scale_mass <- scale(df$masss)
scale_flipper <- scale(df$flipper)
df2 <- data.frame(scale_mass, scale_flipper)
View(df2)
hist(df2$scale_mass)
hist(df2$scale_flipper)
hist(df$masss)

plot(scale_flipper~scale_mass, data=df2)
lm_sc_penguins2 <- lm(scale_flipper~scale_mass,
                      data=df2)
summary(lm_sc_penguins2)

#for every 1% of the length of the fin
#the mass increases by 873% (besides scaling,
#we should have converted mm to m and g to kg)

#TASK
#make linear regression for bill and plot as well
hist(df$bill_L)
hist(df$bill_D)
plot(bill_L~bill_D, data=df)
lm_bill_penguins1 <-  lm(bill_L~bill_D, data=df)
summary(lm_penguins1)
scale_billL <- scale(df$bill_L)
scale_billD <- scale(df$bill_D)
df3 <- data.frame(scale_billL, scale_billD)
View(df3)
hist(df3$scale_billL)
hist(df2$scale_billD)

plot(scale_billL~scale_billD, data=df3)
lm_bill_penguins2 <- lm(scale_billL~scale_billD, data=df3)
summary(lm_bill_penguins2)


#multilinear regression#
hist(df$masss)
hist(df$flipper)
hist(df$bill_L)

lm_penguins3 <- lm(masss~
                     flipper+
                     bill_L,
                   data=df)
summary(lm_penguins3)

#TASK
#make lm model for species GENTOO
#using subset command
?subset
lm_penguins4 <- lm(masss~
                     flipper+
                     bill_L,
                   data=subset(df,species=="Gentoo"))
summary(lm_penguins4)
#correction of TASK (it's the same but try to put this way better):
GT <- subset(df, df$species=='Gentoo')
GT$masss <- scale(GT$masss)
GT$flipper <- scale(GT$flipper)
GT$bill_L <- scale(GT$bill_L)
lm_penguins4 <- lm(masss~
                     flipper+
                     bill_L,
                   data=GT)
summary(lm_penguins4)
