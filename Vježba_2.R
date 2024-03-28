#E exponent
vec8 <- c(1E-3,1E4)
#prirodan logaritam
log(vec8)
#logarithm with base 10
log10(vec8)
log(vec8, base = 10)
log(vec8,base = 4)
#exponential function calculation
exp(vec8)
#Inf-infinity

vec9 <- c(21,22,19,25,28,32,23.5)
cut_vec9 <- cut(vec9,breaks = 3)
cut_vec9
vec9
#intervali
?cut
cut_vec9 <- cut(vec9,breaks = 3,right = F)
cut_vec9

vec10 <- c(2:5)
vec10
cut_vec10 <- cut(vec10,breaks=2)
cut_vec10
cut_vec10 <- cut(vec10,breaks = 2,labels = c("Group1","Group2"))
print(cut_vec10)
print(vec10)

vec10
split_vector <- c(0,2,4,6)
split_vector
split_vec10 <- cut(vec10,breaks = split_vector)
vec10
split_vec10

category <- cut(vec10,breaks = split_vector,labels = c("first","second","third"),ordered_result = T)
print(category)
vec10
#ordered T prema veličini

#text vectors
text_vec <- "Chemometrics,is,cool"
strsplit(text_vec,",")
#razdvajanje po zarezima
gene <- "ATGCTGUUAGCTUGT"
gene
stopcodon <- "UAG"
stopcodon
strsplit(gene,stopcodon)
polypeptides <- strsplit(gene,stopcodon)
polypeptides
gene2 <- paste0(gene,stopcodon)
gene2
#you can divide things and paste them back
ages <- c(5,14,22,30,35,46,57,87,78,56)
ages
cut_ages <- cut(ages,breaks = c(0,30,60,Inf),labels = c("Young","Middle-aged","Elderly"))
cut_ages
ages
remove(split_ages)

#lists
#kombinacija vektora
vec1 <- c(1:9)
vec1
vec3 <- c("severe","mild","control")
vec3
vec4 <- as.factor(c("severe","mild","control"))
vec4
list_vec <- list(vec3,vec4,vec1)
print(list_vec)

list_vec[1]
list_vec[2]
list_vec[8]
length(list_vec)
list_vec[1] <- NULL
length(list_vec)

list_vec <- list(vec3,vec4,vec1)
list_vec

first_part <- list_vec[1:2]
second_part <- list_vec[3]
first_part
second_part


#matrix
#2d data-rows and columns
vec11 <- c(1:10)
vec11
mat <- matrix(vec11,ncol = 5,nrow = 2)
mat
#ncol i nrow ne treba pisat, ako ih se ne napiše treba se pazit na redosljed brojeva
mat <- matrix(vec11,5,2)
View(mat)
mat
?matrix
mat_2 <- matrix(vec11,2,5)
mat_2
View(vec11)

mat[2,2]
#[row,col]
mat
mat[2,1]
mat[1:5,2]
mat[2,1:2]
mat[c(2,5),2]
#names for col and row
colnames(mat) <- c("a","b")
mat
rownames(mat) <- c("c","d","e","f","g")
mat


#funkcije

suma <- function(x,y) {
  zbroj <- x+y 
  return(zbroj)
}
suma(1,2)
suma(5,-7)

task_1 <- function(x,y) {
  substract <- x-y
  return(substract)
}
task_1(10,3)

oduzimanje <- function(x,y,z) {
  zbroj <- x-y-z
  return(zbroj)
}
primjer1 <- oduzimanje(1,2,3)
primjer1
primjer2 <- oduzimanje(5,-7,9)
primjer2


logsuma <- function(val1,val2) {
  zbroj <- log10(val1)+log10(val2) 
  return(zbroj)
}
primjer3 <- logsuma(2,5)
primjer3


#umjesto val1 i val2 može pisat x i y, to je samo naziv, kasnije dodjeljujemo vrijednost

ph <- function(konc) {
  ph_vrijednost <- -log10(konc)
  return(ph_vrijednost)
}
ph(0.002)
ph(3E-5)

toxic_unit <- function(conc,ac50) {
  tu <- conc/ac50
  ltu <- log10(tu)
  return(ltu)
}
primjer4 <- toxic_unit(0.005,0.01)
primjer4

concentration <- 0.005
ac50 <- 0.01
primjer5 <- toxic_unit(concentration,ac50)
primjer5

sava_spojevi <- c(0.01,0.002,0.0005)
ac50 <- c(0.34,1.5,0.001)
primjer6 <- toxic_unit(sava_spojevi,ac50)
primjer6



bmi_classifier <- function(m,v) {
  
  bmi_calculation <- m/v**2
  
  if(bmi_calculation <25) {
    bmi_class <- 'Good'
  }else{
    bmi_class <- 'could be better'
  }
  return(c(bmi_calculation,bmi_class))
}

primjer7 <- bmi_classifier(76,1.83)
primjer7
a <- bmi_classifier(63,1.72)
a



task3 <- function(konc) {
  
  ph_vrijednost <- -log10(konc)
  
  if(ph_vrijednost <7) {
    ph <- 'Acid'
  }else{
    ph <- 'Alkaline'
  }
  return(c(ph_vrijednost,ph))
}
b <- task3(0.005)  
b


#install.package("tidyverse")



vec1 <- c(1:9)
vec2 <- c(T,F,F,T,F,F,F,T,T)
vec3 <- sqrt(vec1**2)
data.frame(vec1,vec2,vec3)
#df is data frame
df1 <- data.frame(vec1,vec2,vec3)
df1
df2 <- data.frame(yes_no=vec2,patient=vec3)
df2
View(df2)
View(df2)

write.table(x=df2,
            file="pokusaj.txt",
            row.names=F,
            col.names=T,
            sep=";")
getwd()


tablica <- read.table(file='pokusaj.txt',
                      sep=";",
                      header=TRUE,
                      stringsAsFactors=T)
View(tablica)


#install.packages("readxl")
#library("readxl")
#remove Nan values - colSums 
#load packages - library(")














