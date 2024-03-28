##VECTORS
#what vectors are and what to do to form them

#I made one vector called vec7
vec7 <- c(1.237, 2.944, 3, 4, 5.5222)
print(vec7) #when I press command+enter, i will se in the console what are the elements
vec7[3] #i want the third element in my vector
vec7[3:5] #when I want to see numbers from 3-5 (from vector)

#how to delete elements from the vector
vec7[-3] #in the console you can see that we have 4 elements becase we expeled one of them (the third one)
print(vec7)
#when we print it, the third the number is still there - because we did not save the new vector

vec7b <- vec7[-3] #vector without the third element, we now want to save vector without the third element
vec7b
print(vec7b)

#it is way easier to code in the script and not in the console because you can easily change if something is wrong

#R in scientific notation
vec8 <- c(1E-3, 1E4)
print(vec8)
#i have formed a new vector which includes zeros, E- -> means 10 to minus sth, eg. E-3 = 0.001
#when you see 1E4 -> 10 to the 4th power, 10000
#if we want numbers, we write them, we do not need to use E if we do not want it

#natural logarithm caluclation
log(vec8)
#in the console I see natural logarithms of this numbers (-6.907755  9.210340)

#logarithm with base 10 or 2,8,...
log10(vec8)
log(vec8, base=10)
log(vec8, base=5) #if I want to use some other bases, not only 10 or natural
log(vec8, base=2)
log(vec8, base=25)

#how to calculate exponential function
exp(vec8)
#in the console we have Inf in the console - it means infinity (pretty big number)

#this function is more complex than these other, we will use the cut function, to categorize elements

vec9 <- c(21, 22, 19, 25, 28, 32, 23.5)
#we want to divide it in three intervals which are of the same lenght
cut_vec9 <- cut(vec9, breaks=3)
cut_vec9
#now i have three different levels
#R is telling me where my number belongs
vec9
#based on this levels I see that where my number belongs, in which interval
#why there are different brackets?
#they mean different stuff
#() - open interval, all elements between these two numbers are included, but the numbers itself are not included
#[] - closed interval from these two elements (numbers)
#(] or [) - numbers with [] are included, and () are not included
#if you want to customize, you can use argument right

?cut #everything about this function is written and also arguments that may be used
cut_vec9 <- cut(vec9, breaks=3, right=F)
cut_vec9

cut_vec9 <- cut(vec9, breaks=3, right=T)
cut_vec9
#we did this because we want to see by which order the brackets will be
#levels 19-23.3, 23.3.-27.7, 27.7-32, because it see the range between 19-32, the range is 13 and 13/3=4.3, each 4.3 we have each interval
cut_vec9.2 <- cut(vec9, breaks=8, right=T)
cut_vec9.2

cut_vec9.2 <- cut(vec9, breaks=2, right=F)
cut_vec9.2
#T/F - to change which numbers are in the specific interval
#T - (]
#F - [)
#now it is not important which brackets we have, but maybe with some datasets it will be important

#creating a vector 
vec10 <- c(2:5) #vector that has numbers 2-5
vec10
cut_vec10 <- cut(vec10, breaks=2)
cut_vec10

#we can give different names to levels

cut_vec10 <- cut(vec10, breaks=2, labels = c("Group1", "Group2"))
cut_vec10
vec10

#this gives us names from the levels, not range of numbers
#first level - Group2, second - Group2
#numbers from vec10
#each number from 2 to 3.5 will belong to Group1, everything else is Group2
#2,3 - Group1; 4,5 - Group2

#more complex examples with cut() function

vec10

#defining vectors with our limits
split_vector <- c(0, 2, 4, 6)
split_vector

#defining cut() function according to split_vector
split_vec10 <- cut(vec10, breaks=split_vector) #i want to break vec10 in intervals defined by another vector, split_vector
vec10
split_vec10
#for each number from vec10 I have correspoding interval
#2-first interval, 3-second interval, 4-second interval, 5-third interval
#you can split existing vector with another vector
#sometimes you will not have intervals, you do not want the same interval
#eg.
split_vector1 <- c(0, 1, 4, 6)
split_vector1
split_vec10.2 <- cut(vec10, breaks=split_vector1) 
vec10
split_vec10.2
#now i made another vectors with differnt intervals; from vec10, none of the numbers are on these intervals

#add labels
category <- cut(vec10,
                breaks=split_vector,
                labels = c("first", "second", "third"),
                ordered_result=F)
category
#at this moment I do not have a grouping order, if we place T not F, you will see that I have <
category <- cut(vec10,
                breaks=split_vector,
                labels = c("first", "second", "third"),
                ordered_result=T)
category #this way I can order it

#it is important to know how to help yourself - ? or Internet 


##TEXT VECTORS
#until now we worked only with numbers, we want to know how to work with text
text_vec <- "Chemometrics, is, cool" #it is important to separate it with comma ,

#splitting the text_vec based on comma
strsplit(text_vec, ",") #you have to tell him by which argument you are splitting the vector
#this means I have three elements

#Creating vectors for genes (stop codon,...)

gene <- "ATGCTGUUAGCTUGT"
gene
stopcodon <- "UAG"
stopcodon
#you want to divide this gene by stop codons
strsplit(gene, stopcodon)
#"ATGCTGU" "CTUGT" this is what i got, i got it splitted by UAG

#to store the result
polypeptides <- strsplit(gene, stopcodon)
polypeptides #now i have two different elements in a new vector

#if you want to past something back
gene2 <- paste0(gene, stopcodon)
gene2

#TASK
ages <- c(22, 27, 29, 99, 76, 43, 23, 21, 17, 10)
ages
grupe <- cut(ages, breaks=c(0,30,60,Inf),
             labels=c("Young", "Middle-aged", "Elderly"))
grupe
ages

##LISTS
vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe", "mild", "control")
vec4 <- as.factor(c("severe", "mild", "control"))

list_vec <- list(vec3, vec4, vec1)
list_vec

#duljina liste
length(list_vec)

#removing elements from the list by name
list_vec[1]
list_vec[1] <- NULL
length(list_vec)

#how to split the list into two parts
list_vec <- list(vec3, vec4, vec1)
print(list_vec)

first_part <- list_vec[1:2]
second_part <- list_vec[3]
first_part
second_part

##MATRIX
#2D data

vec11 <- c(1:10)
mat <- matrix (vec11, ncol=5, nrow=2)
mat
#2rows and 5 columns
#arguments are our data, our vector, number of columns and number of rows
?matrix

#or

mat <- matrix (vec11, 2, 5)
mat
#because R knows what are rows and what are columns (row then columns)
mat_2 <- matrix (vec11, 5, 2)
mat_2 #this will be showed in console, also with print
print(mat_2)
View(mat_2) #to open it in another tab, not in the console; you can also use it with vectors

#same rules for vectors and matrix
mat_2[2,2] #first row then column;
mat_2
mat_2[1:5, 2]
mat_2[2, 1:5] #error, because subscript is out of bound
mat_2 [2, 1:2]
mat_2[c(2,5),2] #second and fifth numbers in second column
#all numbers from every rows we use :
#ako ne idu po redu, koristi se c

#changing column and row names
colnames(mat) <- c("c", "d", "e", "f", "g")
mat
rownames(mat) <- c("a", "b")
mat
#you have to check dimension, how much columns, and how much rows we have


##FUNCTIONS IN R
#functions are code which runs when its called
#we pass some parameters and we get results

suma <- function(x,y) {
  zbroj <- x+y
  return (zbroj)
}

suma(1,2)
suma(5,-7)

#Task1
#make a function that substracts 3 numbers and save result
oduzimanje <- function (x,y,z) {
  minus <- x-y-z
  return(minus)
}
oduzimanje(2,3,5)
oduzimanje(-9,6,-3)
#you have to have in mind if you have positive numbers or negative numbers.
primjer1 <- oduzimanje(1,2,3)
primjer1

primjer2 <- oduzimanje(5,-7,9)
print(primjer2)

#when you have big data
#adds logarithmic numbers with the base od 10

logsuma <- function(val1, val2) {
  zbroj <- log10(val1) + log10(val2)
  return(zbroj)
}

primjer3 <- logsuma(2,5)
primjer3

#Task2
#make a function for pH calculation based on concentration
#-logP

pH <- function (x) {
  log <- -log10(x)
  return(log)
}

pr1 <- pH(3)
pr1
pr2 <- pH(3.4E10)
pr2
pr3 <- pH(4.5E-10)
pr3

#Advanced examples
#toxic unit (EC50) - a value of some solution that kills 50% of population
toxic_unit <- function (conc, ac50) {
  tu <- conc/ac50
  ltu <- log10 (tu)
  return(ltu)
  }

primjer4 <- toxic_unit(0.005, 0.01)
primjer4 #not saved

concentration <- 0.005
ac50 <- 0.01
primjer5 <- toxic_unit(concentration, ac50)
primjer5 #saved
#it understood that I meant concentration as conc because we assigned the numbers later

#we can make same thing with vectors
sava_spojevi <- c(0.01, 0.002, 0.0005)
ac50 <- c(0.34, 1.5, 0.001)
primjer6 <- toxic_unit(sava_spojevi, ac50)
primjer6

#if else ()
naziv_funkcije <- function (argument) {
  operacija <- ono_sto_zelimo_da_funkcija_radi #before we gave it some assignments
  if(uvjeti) {
    klasifikacija
  } else {
    klasifikacija
  }
}

#BMI calculation (mass/height to the second)
bmi_classifier <- function (m,v) {
  bmi_calculation <- m/v**2
  if (bmi_calculation <25) {
    bmi_class <- "Good" #string
  } else {
    bmi_class <- "Could be better" #type of classification of our calculation
  }
  return(c(bmi_calculation, bmi_class))
}

primjer7 <- bmi_classifier(76, 1.83)
primjer7
primjer7.2 <- bmi_classifier(89, 2.0)
primjer7.2

#brackets - when you have a function, it always has to be () and {}, for our first condition
#after the first command you open and close the bracket, if gve another condition we again have to open {}
#to connect two conditions - we use else
#before and after the condition you have to open and close the bracket

#Task3
#make a function for pH calculation based on concentration
#use -log10
#make function with if else () with condition
ph_metar <- function(konc) {
  racunanje <- -log10(konc)
  if (racunanje < 7) {
    naziv <- "acid"
  } else {
    naziv <- "alkaline"
  }
  return(c(racunanje, naziv))
}

pr1 <- ph_metar(7.8E-3)
pr1
pr2 <- ph_metar(3.2E-8)
pr2

#Packages
#packages - big data sets, comprised of things we need
#variety of packages, depending on what we need
#every package needs to be installed
install.packages("tidyverse")
#depending on what we study, we install different packages
#red color - not error, its just the way it is
#once they are installed, we do not need new instalation, we just load them
library("tidyverse") #this is how we load them, if its checked in packages - it is loaded
#if we have a lot of packages, a lot of data, in order not to check for them, we can use this command
stopifnot(require("tidyverse"))
#if we want to check what version of R you have
stopifnot(getRversion() >= "4.1.0")
getRversion()

#you can put "" or '', it is the same
#you have to put library!
#dataframes - lists with vectors

vec1 <- c(1,2,3,4,5,6,7,8,9)
vec2 <- c(T,F,F,T,F,F,F,T,T)
vec3 <- sqrt(vec1**2)

data.frame(vec1, vec2, vec3)

#we can put whatever we want in the vectors

df1 <- data.frame(vec1,vec2,vec3) #df1 - means dataframe
df1

df2 <- data.frame (yes_no = vec2, patient = vec3)
df2 #just to name the dataframe

view(df2) #error, because of the V
View(df2)

write.table(x=df2,
            file="pokusaj.txt",
            row.names=F,
            col.names=T,
            sep=";")
getwd() #in the console I can see where it was saved ("/Users/luciafabijancic")

tablica<-read.table(file="pokusaj.txt", 
                    sep=";",
                    header=TRUE,
                    stringsAsFactors=T)
View(tablica) #i can see the table in the new window



