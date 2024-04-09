#1. Set working directory

#2 Install packages
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("plotly")
install.packages("datasets")
install.packages("dplyr")
install.packages("mir3")
install.packages("Hmisc")

library("tidyverse")
library("ggplot2")
library("plotly")
library("datasets")
library("dplyr")
library("mir3")
library("Hmisc")

#3. Working with datasets
data(package = .packages(all.available = TRUE))
#list the data sets in all
view(iris)

#4. Install package for data science
install.packages("palmerpenguins")
library(palmerpenguins)
#to list this data set
data(package="palmerpenguins")

#5. Prepare dataframe
df <- read.csv(path_to_file("penguins.csv")) #store dataset penguins
view(df)
colSums(is.na(df)) #search for nan values
df <- na.omit(df) #delete all nan values
colSums(is.na(df)) #search again for nan
view(df)

#6.Data explotation
head(df) #to showfirst rows
tail(df, n=7) #to show last rows

names(df)
nrow(df) #number of rows
tr_df <- t(df)

#TASK
#Show last 7 rows in df
tail(df, n=7)
#show number of columns
ncol(df)

#7. Indexing
#Always rows, columns
df$island
df$sex[2:10]
df[2] #to show the hole column
df[3,6] #to sho an exact place
df[1,] #to show the hole row

#TASK
#Show column with weight
df[6]
#Show column with bill length from 11th to 23rd row
df$bill_length_mm[11:23]
#Show 4th row
df[4,]
#Show 6th row with 10th column
df[6,10]

#8. Renaming
toupper(names(df)) #to put the names in mayusculas
tolower(names(df)) #to put the names in minusculas

toupper(df$sex) #to put all the values from a column in MAYUSCULAS
colnames(df)[3]="bill_L" #to rename column 3
names(df)

#to create a vector with the names of the columns and then put names(df) <- "name of the vector" to change all of the in the df
col_names <- c("species", "island", "bill_L", "bill_D", "flipper", "mass", "sex","year")
names(df) <- col_names
view(df)

#9. Descriptive statistics
summary(df) #to show statistics values
table(df$species) #frequency - categorical data

mean(df$bill_L)
median(df$flipper)
max(df$mass)
min(df$mass)
sd(df$mass)

#TASK
#show frequency of data in column island
table(df$island)
#which is max value of flipper
max(df$flipper)
#what is min value of flipper
min(df$flipper)
#median of year
median(df$year)

#10. Subsets
#We would like to see average mass by habitat
aggregate(df$mass,  #variable of interest
          list(df$island),
          FUN = mean)
#can be written as:
aggregate(x=mass ~island,
          data = df,
          FUN = mean)

#command table() has similar function
table(df$sex)
aggregate(x=df$sex,
          by = list(df$sex), #group by sex
          FUN=length) #number of each individual in the category
#aggregate can be used for more conditions
aggregate(x=df$mass,
          by = list (df$island, df$sex),
          FUN=mean)

#TASK
#calculate average flipper length by sex
aggregate(df$flipper,
          list(df$sex),
          FUN= mean)
#calculate max mass by islands
aggregate(df$mass,
          list(df$island),
          FUN=max)
#aggregate bill length by island and species
aggregate(df$bill_L,
          list(df$island, df$species),
          FUN = data.frame)
install.packages("Hmisc")
library("Hmisc")

#11 Useful commands
tr_df <- t(df) #transforming
newCol <- mutate(df, #addingn new column based on a condition
                 mass_kg = mass/1000) #we want to convert grams to kilograms
view(newCol)

#12 selection  of certain data
#using the select() function, we can select only the elements we are interesed in
#we want to select only data about bill

selected <- select(df, 
                   bill_L, bill_D)
view(selected)

#selecting data from to

head(df)
#selection only numerical data from bill-masss
selected2 <- select(df,
                    bill_L:mass)
view(selected2)         
head(selectd2, 3L)
head(selected2, 3L)

#TASK
#add a new column with surface of the bill

newCol <- mutate(df,
                 surface = bill_L * bill_D)
view(newCol)

#select last 3 columns
selected2 <- select(df,
                    mass,sex,year)
view(selected2)

#13.Pipeline %>%
# Shift + command + M

#concept of writing code
#
#

#calculate the log of the number 100 to base 10
log10(100)

#pipeline example
100 %>% log10()

#more complicated example
sqrt(log(cos(sin(pi))))
pi %>% sin %>% cos %>% log %>% sqrt

#TASK
#Calculate the sin of the number pi traditionally and using the pipeline
sin(pi)
pi %>% sin()

#write pipeline for:
sqrt (log10(100))
100 %>% log10 %>% sqrt
#pipeline and statistics
#we have dataset penguins
#we want to group it according to species
#then we want to make statistics that will include mean, sd and max

df %>%        #dataset
  group_by(species) %>% #group  by species
  summarise(
    a = mean(mass),    #mean penguin mass
    stdev = sd(mass),  #study penguin mass
    max= max(mass))    #max penguin mass

#we want to see penguins heavier than 5kg
#pipeline and function susbset()
df %>% 
  subset(mass > 5000)

#TASK
#we want to see penguins heavier than 5kg
#pipeline average mass by island
df %>% 
  subset(mass>5000) %>% 
  aggregate(mass~island,
            FUN=mean)

#PLOTS
#1. the basic graph is a plot showing the relationship
plot(x= df$mass, y=df$flipper)

#elements we can add to the plot
plot(x=df$mass, y=df$flipper,
     main="Mass and flipper lengths",
     xlab="Mass (g)",
     ylab="Flipper length(mm)",
     pch=16,
     col=grey(.0,.1))
#make it more pretty
grid()

#caclulate regression model and add it to the grid
model <- lm(formula = mass~flipper,
            data=df)
abline(m, col="")  ??????????
  
#2. Bar charts
  
gglplot(df, aes(x=species)) + #chosen data frame and axis
  geom_bar() #ggplot code needs a command part of the code

ggplot(df, aes(x=species)) +
  geom_bar(fill="Blue", color="Red", width = 0.4) +
  xlab("Species") + 
  ylab("Number") 

#if we want 0. to be aligned with the origin of the axis
ggplot(df, aes(x=species)) +
  geom_bar(fill="Blue", color="Red", width = 0.4) +
  ggtitle("Penguins species") +
  xlab("Species") + 
  ylab("Number") +
  scale_y_continuous(expand = c(0, 0))

#TASK
#make bar chart for islands
ggplot(df, aes(x=island)) +
  geom_bar()
#graph elements: title, axis names
ggplot(df, aes(x=species)) +
  ggtitle("Penguins in the Islands") +
  geom_bar(fill="purple", color="green", width=1) +
  xlab("Islands") +
  ylab("Penguins")

#purple color with green borders, column width 1

#3. Pie charts
#make bsic bar chart

ggplot(df, aes(x="", y=sex, fill=species)) + 
  geom_bar(stat="identity", width=1)

#barplot naturally does count data
#stat= "identity" calculates the sum of y variables

ggplot(df, aes(x="", y=sex, fill=species)) + 
  geom_bar(stat="identity", width=1) +
  coord_polar ("y", start=0) #function that circles the bar plot in the


#DAY2
#We change color by preference
ggplot(df, aes(x="", y=sex, fill=species)) + 
  geom_bar(stat="identity", width=1) +
  coord_polar ("y", start=0) +
  scale_fill_brewer(palette="PiYG") +
  theme_minimal()

#so that we don-t have to run the code every time , save 
#it is also easier to add elements (color and similar) to
#write the code at the beginning.

pie <- ggplot(df, aes(x="", y=sex, fill=species)) +
  geom_bar(stat = "identity", width=1) +
  coord_polar("y", start=0)
pie

blue_pie <- pie +
  scale_fill_brewer(palette="Blues")+
  theme_minimal()
blue_pie

##
?mpg
view(mpg)


#ADVANCED CHARTS
#We take data from built-in sets
#data from the BOD set

#BOD
view(BOD)
ggplot(BOD, aes(x=Time, y=demand))+
  geom_point(size=5, color="Blue") +
  geom_line(color="Red")

#...penguins?

ggplot(BOD, aes(x= mass, y= flipper))+
  geom_point(size=5, color="Blue") +
  geom_line(color="Red")

#...subset? (it chooses part of the data set)
ggplot(subset(df,species == "Chinstrap"),aes(x=body, y= flipper)) + 
  geom_point(size=5, color="Blue")+
  geom_line(color="Red")

#Data from the CO2 set
?CO2
view(CO2)

CO2 %>% 
  ggplot(aes(conc, uptake,
             color= Treatment)) +
  geom_point(size=3, alpha=5) +
  geom_smooth(method=lm, se=F) +
  facet_wrap(~Type) +
  labs(title="Conc")+
  theme_bw()

?geom_smooth
?facet_wrap

#TASK
#penguins.. x:mass, y:flipper, color by sex
#make 3 graphs based on islands (this is with facet_wrap)
df %>% 
  ggplot(aes(body_mass_g, flipper_length_mm,
             color= sex)) +
  geom_point(size=3, alpha=5) +
  geom_smooth(method=lm, se=F) +
  facet_wrap(~island) +
  labs(title="Penguins")+
  theme_bw()

###
CO2 %>% 
  ggplot(aes(Treatment, uptake)) +
  geom_boxplot()+
  geom_point(alpha=5,
             aes(size=conc, color=Plant))+
  facet_wrap(~Type)+
  coord_flip()+
  theme_bw()+
  labs(title = "Treatment Effects on uptake with plant variation")

#TASK
#...penguins?
#x=sex, y=flipper, size and color of dots
#condition: mass and species,
#graphs by island

df %>% 
  ggplot(aes(sex, flipper)) +
  geom_boxplot()+
  geom_point(alpha=5,
             aes(size=mass, color=species))+
  facet_wrap(~island)+
  coord_flip()+
  theme_bw()+
  labs(title = "Penguins")

#

mpg %>% 
  filter(cty<25) %>% 
  ggplot(aes(displ,cty))+
  geom_point(aes(color=drv,
                 size=trans),alpha=.3,)+
  geom_smooth(method = lm, se= F)+
  facet_wrap(~species)+
  theme_bw()+
  labs(x="x", y="y", title="Penguins")


install.packages("ggfortify")
install.packages("palmerpenguins")
install.packages("devtools")
install.packages("vqv/ggbiplot")
install.packages("rpart.plot")
install.packages("caret")
install.packages("ggpubr")
install.packages("GGally")
install.packages("rpart")

library("ggfortify")
library("palmerpenguins")
library("devtools")
library("vqv/ggbiplot")
library("rpart.plot")
library("caret")
library("ggpubr")
library("GGally")
library("rpart")

#STATISTICS
#T-test (2 samples)

#first you should always familiarize yourself with the data:
view(df)

ggplot(df, aes(x=flipper)) +
  geom_histogram(birwidth=10, fill="Blue", color="White") +
  facet_wrap(~sex, ncol=1)
ggplot(df, aes(x=sex, y=flipper, color=sex)) +
  geom_boxplot()

#calculation of mean values

aggregate(df$flipper,
          by=list(df$sex),
          FUN=mean)
#conducting a statistical test
t.test(flipper~sex, data=df)

#t-test for mass per sex
aggregate(df$mass,
          by=list(df$sex),
          FUN=mean)
t.test(mass~sex, data=df)

#according to the island the live on: given that we have more than 2 islands, so we need to perform a 1 way ANOVA ANALYSIS
#analysis assumptions:
#datasets are normally disdtributed
#datasets have equal variance

#box plot

ggplot(df,aes(x=island, y=bill_L,
              color=island)) +
  geom_boxplot()+
  theme_bw()+
  coord_flip()
#mean values

aggregate(df$bill_L, by=list(df$island), FUN=mean)

#let´s do an analysis of variance (anova), and save it as an R object

bill_oa <- aov(formula = bill_L ~ island,
               data=df)

bill_oa_lm <- lm(formula=bill_L ~ island,
                 data=df)
summary(bill_oa_lm)

table(df$species, df$island)

#graph(1st way)
ggplot(df)+
  aes(x=species, fill=island)+
  geom_bar()

#graph(2nd way)
ggplot(df)+
  aes(x=species, fill=island)+
  geom_bar(position = "dodge")

#chi sq test
test <- chisq.test(table(df$species, df$island))
test

#Mann-Whitney U test
#bill depth is same in both sexes

#graph
ggplot(df, aes(x=sex, y=bill_D, fill=sex))+
  stat_boxplot(geom="errorbar", width=0.5) +
  geom_boxplot(fill="light blue")+
  stat_summary(fun=mean, geom="point",
               shape=10, size=3.5, color="Black") +
  ggtitle("Boxplot of bill depth")+
  theme_bw() + theme(legend.position = "none")

#test
res <- wilcox.test(bill_D ~ sex,
                   data=df,
                   exact=FALSE)
res

#TASK
#is there difference in flipper length
#by sex (and graph)

#CORRELATION
heatmap(df)

#Filter numeric variables
numeric_vars <- sapply(df, is.numeric)
penguins_numeric <- df[, numeric_vars]
#compute correlation matrix
cor_matrix <- cor(penguins_numeric)
view(cor_matrix)
#©onvert correlation matrix to longer format
cor_df <- reshape2::melt(cor_matrix)
#Create a heatmap using ggplot2
ggplot(cor_df, aes(Var1,Var2, fill=value))+
  geom_tile() +
  scale_fill_gradient2(low="blue", mid="white",
                       high="red", midpoint=0,
                       limits=c(-1,1),
                       name="Correlation") +
  theme_minimal()+
  labs(title = "Correlation Matrix Heatmap")

#pearson
cor(df$mass, df$flipper, method="pearson")

#INTERPRETATION
#correlation coefficient
#correlation ranges from -1 to 1
#The direction of the relationship between the 3 variables
#The strength of the relationship between the 2 variables

#spearman
cor(df$mass, df$flipper, method="spearman")

#linear regresion
#data distribution plots

hist(df$mass)
hist(df$flipper)
plot(flipper ~ mass, data=df)

#linear models
lm_penguins <- lm(flipper~mass, data=df)
summary(lm_penguins)

#we got very small numbers and sthe solution would be scaling

#scaling
scale_mass <- scale(df$mass)
scale_flipper <- scale(df$flipper)
df2 <- data.frame(scale_mass, scale_flipper)
view(df2)
hist(df2$scale_mass)
hist(df2$scale_flipper)
hist(df$mass)

plot(scale_flipper ~scale_mass, data=df2)
lm_sc_penguin2 <- lm(scale_flipper ~ scale_mass,
                     data=df2)
summary(lm_sc_penguin2)

#for every 1% of the length of the fin, the mass increases by 873% (besides scaling, we should have converted
#mm to m and g to kg)

#TASK
#make linear regression for bill and plot ?????
hist(df$bill_D)
hist(df$bill_L)
scale_bill_D <- scale(df$bill_D)
scale_scale_L <- scale(df$bill_L)
plot(scale_bill_D ~scale_scale_L, data=df2)
lm_sc_penguin2 <- lm(scale_bill_D ~ scale_scale_L,
                     data=df2)
summary(lm_sc_penguin2)

#multilinear regression
hist(df$mass)
hist(df$flipper)
hist(df$bill_L)

lm_penguins3 <- lm(mass~
                     flipper + bill_L,
                   data=df)
summary(lm_penguins3)

#TASK
#make the model for species GENTOO
#using subset command

GT <- subset(df, df$species =="Gentoo")

GT$mass <- scale(GT$mass)
GT$flipper <- scale(GT$flipper)
GT$bill_L <- scale(GT$bill_L)

lm_adelci <- lm(mass~
                  flipper +
                  bill_L,
                data=GT)
view(GT)
summary(lm_adelci)
