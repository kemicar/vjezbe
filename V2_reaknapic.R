vec7 <-c(1.237,2.944,3,4,5.5222)
print(vec7)
vec7[3]

#htjeli smo vidjeti 3. element

vec7[3:5]
#brojevi od 3. do 5.

#how to delete or expel numbers from vectors: stavimo minus ispred broja
vec7[-3]
print(vec7)

#broj je i dalje tu jer nismo spremili  promjenu 
vec7b <- vec7[-3]

vec7b

#R can also work in scientific notation --> E denotes exponent
vec8 <- c(1E-3,1E4)
#ovdje E - 3 znači 10^-3
#E-3 denotes 0.001, while E4 denotes 10000
print(vec8)

#prirodni logaritmi
log(vec8)

#logaritmi s bazom 10
log10(vec8)

log(vec8,base=2)
log2(vec8)

#eksponencijalna funkcija 
exp(vec8)


#cut() funkcija

vec9 <- c(21,22,19,25,28,32,23.5)

#želimo podijeliti vektor pa koristimo cut() funkciju

cut_vec9 <- cut(vec9, breaks = 3)
cut_vec9
vec9
?cut

cut_vec9 <- cut(vec9, breaks =3, right = T)
cut_vec9

cut_vec9 <- cut(vec9, breaks =2, right = T)
cut_vec9

cut_vec9 <- cut(vec9, breaks=3, right=T)
cut_vec9

cut_vec9 <- cut(vec9, breaks =3, right = F)
cut_vec9


vec10 <- c(2:5)
vec10

#dividing vector into intervals - cut!!!

cut_vec10 <- cut(vec10, breaks=2)
print(cut_vec10)

cut_vec10 <- cut(vec10, breaks =2, labels = c("Group1", "Group2"))
print(cut_vec10)
print(vec10)


#more complex examples 

vec10

#splitting vectors - labelling it by setting our own limits

#intervali između 0 i 2, 2 i 4, 4 i 6

#split vector

split_vector <- c(0,2,4,6)
split_vector

#divide vec10 with this split vector

split_vec10 <- cut(vec10, breaks = split_vector)
vec10
split_vec10


category <- cut(vec10,
                breaks = split_vector,
                labels = c('first', 'second', 'third'),
                ordered_result = T)
print(category)

#ordering kad se stavi TRUE

?cut


#text vectors

text_vec <- 'Chemometrics, is, cool'

#bitno da odvojimo riječi zarezom

strsplit(text_vec,',')

gene <- 'ATGCTGUUAGCTUGT'
gene

stopcodon <- 'UAG'

strsplit(gene, stopcodon)

#storing kao novi vektor

polypeptides <- strsplit(gene, stopcodon)
polypeptides

gene2 <- paste0(gene, stopcodon)
gene2
#to paste something back


#TASK

ages <- c(18,21,23,33,45,55,7,78,10,91)
ages

age_groups <- cut(ages, breaks = c(0,30,60, Inf),
                  labels = c("Young(0-30)", "Middle-aged(31-60)", "Elderly(61+)"))
age_groups
ages




#LISTS - liste

#combination of vectors

vec1 <- c(1,2,3,4,5,6,7,8,9)
vec3 <- c("severe", "mild", "control")
vec4 <- as.factor(c("svevere","mild", "control"))

list_vec <- list(vec3, vec4, vec1)
print(list_vec)


#accesing the first element of the list

list_vec[9]
#there is no such element - za 9

list_vec[1]
length(list_vec)

list_vec[1]
list_vec[1] <- NULL

length(list_vec)


#splitting lists

list_vec <- list(vec3, vec4, vec1)
print(list_vec)

#dividing into 2 different parts

first_part <- list_vec[1:2]
second_part <- list_vec[3]

first_part
second_part

first_part <- list_vec[c(1,3)]
second_part <- list_vec[2:3]

first_part
second_part

#MATRICE

?matrix

vec11 <- c(1:10)

mat <- matrix(vec11, ncol =5, nrow = 2)
mat


mat <- matrix(vec11, 5, 2) # 5 rows and 2 columns
mat

mat_2 <- matrix(vec11, 2, 5) # 2 rows and 5 columns
mat_2

View(mat_2) # matrix in a new tab
print(mat) 

View(vec11)


mat[2,2]
#first row then column

mat

mat[2,1]

mat[1:5,2]

mat[2, 1:5]
#we don't have 5different columns- zato je error

mat[c(2,5),2]

#changing column and row names

View(mat)

colnames(mat) <- c("a", "b")
mat

rownames(mat) <- c("c", "d", "e", "f", "g")
mat

View(mat)



#FUNCTIONS


#1. FUNCTION THAT ADDS 2 NUMBERS

suma <- function(x, y) {
  zbroj <- x + y
  return(zbroj)
}

suma(1,2)
suma(5,-7)


#TASK 1
#make an function that substracts 3 numbers and save result

oduzimanje <- function(x, y, z) {
  zbroj <- x - y - z
  return(zbroj)
}

primjer1 <- oduzimanje(1,2,3)
primjer1

primjer2 <- oduzimanje(5, -7, 9)
print(primjer2)


logsuma <- function(val1,val2) {
  zbroj <- log10(val1) + log10(val2)
  return(zbroj)
}

primjer3 <-logsuma(2,5)
primjer3

#TASK2

ph <- function(conc.) {
  ph_vrijednost <- -log10(conc.)
  return(ph_vrijednost)
}

primjer4 <-ph(0.1)
primjer4

ph(0.002)
ph(3E-5)



#toxic unit EC50

toxic_unit <- function(conc, ac50) {
  tu <- conc/ac50
  ltu <- log10(tu)
  return(ltu)
}

primjer5 <- toxic_unit(0.005, 0.01)
primjer5

concentration <- 0.005
ac50 <- 0.01

primjer6 <- toxic_unit(concentration, ac50)
primjer6


sava_spojevi <- c(0.01, 0.002, 0.0005)
ac50 <- c(0.34, 1.5, 0.001)

primjer7 <- toxic_unit(sava_spojevi, ac50)
primjer7


#IF ELSE

bmi_classifier <- function(m, v) {
  
  bmi_calculation <- m/v**2
  
  if(bmi_calculation < 25) {
    bmi_class <- 'Good'
  } else {
    bmi_class <- 'Could be better'
  }
  return(c(bmi_calculation, bmi_class))
}

primjer8 <- bmi_classifier(76, 1.83)
primjer8


#TASK3

ph <- function(conc.) {
  ph_vrijednost <- -log10(conc.)
  return(ph_vrijednost)
}

ph_classifier <- function(conc.) {
  
  ph_calculation <- -log10(conc.)
  
  if (ph_calculation < 7) {
    ph_class <- 'Acidic'
  } else {
    ph_class <- 'Alkaline'
  }
  return(c(ph_calculation, ph_class))
}

primjer9 <- ph_classifier (0.01)
primjer9



#PACKAGES

install.packages("tidyverse")

library("tidyverse")

stopifnot(require('tidyverse'))

#stopifnot(getRversion() >= "4.1.0")


getRversion()


#DATA FRAMES - lists with vectors --> equally long vectors

vec1 <- c(1,2,3,4,5,6,7,8,9)
vec2 <- c(T,F,F,T,F,F,F,T,T)
vec3 <- sqrt(vec1**2)

data.frame(vec1, vec2, vec3)


#time efficiency: data frame je df
df1 <- data.frame(vec1, vec2, vec3)
df1

df2 <- data.frame(yes_no = vec2, patient = vec3)
print(df2)

View(df2)
view(df2)

#if we want to save/export table as .txt
#command: write table


write.table(x = df2,
            file = "pokusaj.txt",
            row.names = F,
            col.names = T,
            sep = ";") 

#ako ne znamo gdje smo, u kojem directory/map

getwd()

#changing working directory

#setwd()


tablica <- read.table(file = "pokusaj.txt",
                      sep = ";",
                      header = TRUE,
                      stringsAsFactors = T)
View(tablica)