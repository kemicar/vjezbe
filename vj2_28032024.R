print("Hello World")
vec7 <- c(1,1.1,2.2,4,333)
print(vec7)
vec7[2]
print(vec7)
vec7[3]
vec7[3:5]
vec7[-3]
print(vec7)
vec7b <- vec7[-3]
print(vec7b)
vec7b
vec8 <- c(1E-3, 1E4)
vec8
log(vec8)
log(vec8, base=2)
exp(vec8)
log10(vec8)
vec9 <- c(21,22,19,25,28,32,23.5)
cut_vec9 <- cut(vec9, breaks=3)
vec9
cut_vec9
?cut
cut_vec9 <- cut(vec9, breaks=3, right=T)
cut_vec9
vec10 <- c(2:5)
vec10
cut_vec10 <- cut(vec10, breaks=2)
print(cut_vec10)
cut_vec10 <- cut(vec10,breaks=2,labels=c("group1","group2"))
print(cut_vec10)
vec10






vec10
split_vector <- c(0,2,4,6)
split_vector
split_vec10 <- cut(vec10, breaks=split_vector)
split_vec10
category <- cut(vec10,
                  breaks = split_vector,
                  labels = c("first","second","third"),
                  ordered_result = T)
print(category)
text_vec <- "Chemometrics,is,cool"
print(text_vec)
strsplit(text_vec,",")
gene <- "ATGCTGUUAGCTUGT"
gene
stopcodon <- "UAG"
stopcodon
strsplit(gene, stopcodon)
polypeptides <- strsplit(gene,stopcodon)
polypeptides
gene2 <- paste0(gene,stopcodon)
gene2
#task
ages <- c(5,10,15,20,25,35,45,55,65)
ages
cut_ages <- cut(ages, breaks=3, labels=c("young","middle-aged","elderly"))
cut_ages
split_ages <- c(0,30,60,61)
split_ages1 <- cut(ages, breaks=split_ages)
split_ages1
ages



age_groups <- cut(ages, breaks= c(0,30,60,Inf),labels = c("Young", "M-A", "Elderly"))
age_groups
##List

vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe","mild","control")
vec4 <- as.factor(c("severe","mild","control"))
list_vec <- list(vec3,vec4,vec1)
list_vec
list_vec[2]


length(list_vec)


list_vec[1] <- NULL
length(list_vec)
list_vec <- list(vec3, vec4,vec1)
list_vec

first_part <- list_vec[1:2]
second_part <- list_vec[3]

first_part
second_part



##########################Matrix

#2D data, rows, coloumns
vec11 <- c(1:10)
mat <- matrix(vec11, ncol=5, nrow=2)
mat
mat <- matrix(vec11,5,2)
mat
mat_2 <- matrix(vec11,2,5)
mat_2
mat

mat
View(mat)
View(vec1)
?mat
?matrix


mat[2,2]
mat
mat[5,2]
mat[1:5,2]
mat[c(2,5),2]


colnames(mat) <- c("a","b")
mat
rownames(mat) <- c("c","d","e","f","g")
mat
View(mat)








##Functions
suma <- function(x, y){
  zbroj <- x + y
  return(zbroj)
}

suma(1,2)
suma(5,-7)

#TASK 1
oduzimanje <- function(x,y,z){
  razlika <- x-y-z
  return(razlika)
}
oduzimanje(1,2,3)
oduzimanje(10,10,10)
oduzimanje(-10,-10,-10)


logsuma <- function(val1,val2){
  zbroj <- log10(val1)+log10(val2)
  return(zbroj)
}
logsuma(1,2)
logsuma(2,5)
primjer3 <- logsuma(2,5)
primjer3


#TASK2 - pH

pH <- function(conc1){
  zbroj <- -log10(conc1)
  return(zbroj)
}
pH(3)
pH(0.5)
pH(10)
pH(1E-3)


#toxic unit

toxic_unit <- function(conc, ac50){
  tu <- conc/ac50
  ltu <- log10(tu)
  return(ltu)
}

primjer4 <- toxic_unit(0.005,0.01)
primjer4

concentration <- 0.005
ac50 <- 0.01

primjer5 <- toxic_unit(concentration, ac50)
primjer5

#values as vectors

sava_spojevi <- c(0.01,0.002,0.0005)
ac50 <- c(0.34,1.5,0.001)
primjer6 <- toxic_unit(sava_spojevi, ac50)
primjer6

#if else ()

bmi_classifier <- function(m,v){
  bmi_calc <- m/v**2
  
  if(bmi_calc<25){
    bmi_class <- "good"
  }else{
    bmi_class <- "could be better"
  }
  return(c(bmi_calc, bmi_class))
}
primjer7 <- bmi_classifier(80,1.80)
primjer7


#TASK3

pH <- function(conc1){
  zbroj <- -log10(conc1)
    if(zbroj < 7){
      ph <- "kiselo"
    }else{
      ph <- "luznato"
    }
  return(c(zbroj, ph))
}
pH(0.01)
pH(0.0000002)
pH(1)
pH(1E-20)
pH(0.5)

#packages

install.packages("tidyverse")
library("tidyverse")

stopifnot(require("tidyverse"))
stopifnot(getRversion() >= "4.1.0")
getRversion()

#data frames
vec100 <- c(1,2,3,4,5,6,7,8,9)
vec200 <- c(T,F,F,T,F,F,F,F,T)
vec300 <- sqrt(vec1**2)
data.frame(vec100, vec200, vec300)

df1 <- data.frame(vec100, vec200, vec300)
df1
df2 <- data.frame(yes_no = vec200, patient = vec300)
df2
View(df2)

write.table(x=df2,
            file = "pokusaj.txt",
            row.names = F,
            col.names = T,
            sep = ";")
getwd()

tablica <- read.table(file="pokusaj.txt",
                      sep=";",
                      header = TRUE,
                      stringsAsFactors = T)
tablica
View(tablica)
