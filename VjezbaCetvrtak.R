vec7[2]
vec8[3:5]
vec8[-3]
vec8
if we save the new vector when we deleted the 3rd component - its deleted in the vector8 as well
vec8b <- vec8[-3]
vec8b
vec8b[-2, -3]
vec8c <- vec8[-2,-3]
vec8c<- vec8[-2:-3]
vec8c
R can work in scientific notations as well, where E denotes exponent
#E-3 denotes 0.001
#natural logarithm 
log (vec8)
log (vec8, base - 10)
vec9 <- c(1E-3, 1E4)
log(vec9)
#exponential function calculation
exp (vec9)
log(vec9, base - 8)
log (vec9, base <- 8)
#exponential function calculation
exp(vec9)
sqrt(vec9)
#if ou want to customize the interval rotation, you can use the right parameter cut
vec10 <- c(21,22,19,25,28,32,23.5)
cut_vec10 <- cut (vec10, breaks = 3)
vec10
cut_vec10 <- cut (vec10, breaks =3, right=F)
?cut
with the argument right we can reverse our notation
vec11 <- c(18, 22, 24, 25, 26.5)
cut_vec11 <- cut (vec11, breaks=4)
cut_vec11
cut_vec10 <- cut (vec10, breaks=3, right=T)
cut_vec10
 false/true changes the intervals, it includes/excludes numbers
 vec12 <- c(2:5)
vec12
cut_vec12
cut_vec12 <- cut(vec12, breaks=2, labels= c(("Group1", "Group2"))
cut_vec12 <- cut(vec12, breaks=2, labels = c("Group1", "Group2")
cut_vec12                 
print (cut_vec12)                 
print(vec12)
print (cut_vec12)
print(vec12)
#split the vector by setting our own limits 
#defining categories using a vector 
split_vector <- c(0,2,4,6)
split_vector
#divide vec12 with this vector - we wont use the number of breaks but we will split it by anotehr vector - split vector
split_vec12 <- cut(vec12, breaks=split_vector)
split_vec12
#useful bcs smtms we want to define our own intervals
#text vectors
category <- cut (vec12, breaks= split_vector, labels = c('first','second','third'), ordered_result = T)
print (category)
print(category)
#text vectors
text_vec <- 'Chemometrics, is, cool'
#splitting the text_vec vector based on comma
strsplit(text_vec,',') 
#creating two vectors, e.g., gene and stop codon, and splitting the first vector based on the second
text_vec <- 'Chemometrics,is, cool'
print(text_vec)
gene <- 'ATGCTGUUAGCTUGT'
print(gene)
stopcodon <- 'UAG'
print(stopcodon)
#storing the result as a new vector 
polypeptides <- strsplit (gene, stopcodon)
polypeptides
#paste something back 
gene2 <- paste0(gene, stopcodon)
gene2
vec13 <- c(2,10,25,28,33,54,59,65,78,95)
age <- vec13
print(age)
split_vector <- c(0,30,60,100)
split_vec13 <- cut(0,30,60,Inf)
split_vec13 <- cut(vec13, breaks=split_vec13)
category <- cut (vec13, breaks= split_vec13, labels = c('young','middle-aged','elderly'), ordered_result = T)
#STEP1
ages<-c(2,10,25,28,33,54,59,65,78,95)
ages
#step2: use cut() function to categorize ages into groups
age_groups <- cut(ages, breaks= c(0,30,60,Inf), labels = c("Young", "Middle-Aged", "Elderly"))
print (age_groups)
ages
####LISTS

#combination of vectors
vec2
vec3 <- c(2,4,5,6,7)
vec3
vec3 <- c("severe", "mild", "control")
vec3
vec4 <- as.factor (c("severe", "mild", "control"))
list_vec <- list(vec3, vec4, vec1)
print(list_vec)
#length
lenth(list_vec)
length(list_vec)
#removing element from the list by name 
list_vec [1]
list_vec [1] <- NULL
length(list_vec)
?as.factor
#split the list in 2 parts
list_vec <- (vec3,vec4,vec1)
list_vec <- list(vec3, vec4, vec1)
print(list_vec)
first_part <- list_vec[c(1,3)]
second_part <- list_vec [2:3]
print(first_part)
print(second_part)
#Matrix
vec12
vec11(1:10)
vec11 <- c(1:10)
mat <- matrix (vec11, ncol=5, nrow=2)
mat
#first, the number of rows is defined, then the number of columns
mat <- matrix (vec11, 5, 2) #5 rows, 2 columns
mat_2

mat
mat_2 <- matrix (vec11, 2, 5)
mat

print(mat)
view(mat)
View(mat)
vec11
View (vec11)
vec15 <- c(0:15)
mat <- matrix (vec15, 5, 5)
mat
mat_3 <- matrix (vec15,4,4)
mat_3

#in idenxing the same rule applies; first row, then column
mat [2,1]
mat [1:5, 2]
mat [2, 1:5] 
mat [2, 1:6]
mat[c(2,5), 2] #2 and 5 row in a 2 column
View(mat)

#changing column and row names
colnames(mat) <- c("a", "b", "c", "d", "e")
mat
rownames(mat) <- c("f", "g", "h", "i", "j")
mat

####FUNCTIONS IN R####
#FUNCTION THAT ADDS 2 NUMBERS 

suma <- function(x,y) { 
      zbroj <- x+y
      return(zbroj)
}
suma(1,2)
suma(5, -7)

#TASK NO 1
#make a function that subtracts 3 numbers and save result 
subtract_three <- function(a,b,c)
  result <- a-b-c
  return(result)
}
result <- subtract_three (10,5,3)
print(result)
result <- subtract_three (5,4,5)
print(result)

#make a function that adds logarithmic values of two numbers (base 10) and save results

logsuma <- function(val1, val2) {
  zbroj <- log10(val1) + log10(val2)
  return(zbroj)
}
}
primjer3 <- logsuma (2,5)
primjer3

concentration <- 1E-7

pH <- calc_pH (concentration)
print(pH)

###### ADVANCED EXAMPLES
#calculate toxic unit (EC50)

toxic_unit <- function (conc, ac50) {
  tu <- conc/ac50
  ltu <- log10 (tu)
  return (ltu)
}
#enter arguments into toxic unit 
primjer4 <- toxic_unit(0.005, 0.01)
print(primjer4)
primjer4

concentration <- 0.005
ac50 <- 0.01
primjer5 <- toxic_unit (concentration, ac50)
primjer5

#enter values saved as vectors

sava_spojevi <- c(0.01, 0.002, 0.0005)
ac50 <- c (0.34, 1.5, 0.001)
primjer6 <- toxic_unit(sava_spojevi, ac50)
primjer6


#sto se dogada dosl?? ponoviti opet!!!

# advanced examples with if else(

naziv_funckije <- function(argument){
  operacija <- ono_sto_zelimo_da_funkcija_radi
  if
}

#bmi 
bmi_classifier <- function (m,v) {
  bmi_calculation <- m/v**2
  
  if (bmi_calculation < 25) {
    bmi_class <- 'Good'
  } else {
    bmi_class <- 'Could be better'
  }
  return (c(bmi_calculation, bmi_class))
} 
primjer7 <- bmi_classifier(76, 1.83)
print(primjer7)
primjer8 <- bmi_classifier (83, 1.70)
print(primjer8)

#ubitcuse:)

#TASK 3
pH <- function(concentraction) {
  pH_value <- -log10 (concentraction)
  
  if (pH <7) {
    ph_class <- 'Acid'
  }else {
    ph_class <- 'Alkaline'
  } 
  return (c(ph, ph_class))
  }
primjer10 <- pH (1E-7)
print(primjer10)

ph <- function(konc) {
  ph_vrijednost <- -log10(konc)
  if (ph_vrijednost < 7){
    ph_klasa <- "acid"
  } else {
    ph_klasa <- "alkaline"
  }
  return(c(ph_vrijednost, ph_klasa))
}

#packages#####
#every package needs installing 


four <- 4 
four <-4
four
install.packages("tidyverse")
stopifnot (getRversion() >= "4.1.0")
getRversion()


##########FRAMES###############

lists with vectors

#lets make 3 vectors

vec1 <- c(1,2,3,4,5,6,7,8,9)
vec2 <- c(T,F,F,T,F,F,F,T,T)
vec3 <- sqrt (vec1**2)

#with data.frame command we will make dta with these three vectors

data.frame(vec1, vec2, vec3)
df1 <- data.frame (vec1, vec2,vec3)
df1

df2 <- data.frame (yes_no = vec2, patient = vec3)
df2

View (df2)
view (df2)
View (df1)
view (df1)
library ('tidyverse')
view(df2)
view (df1)

# we want to save data frame as a table 

write.table (x=df2, 
             file =pokusaj.txt'
             row.names=F,
             col.names=T,
             sep=";")
#zasto ovaj kod ne 
ten <- ten
te


###Excel###

#loading .txt instead of excel bcs it can have empty cells
library ("readxl")

#we want to see the no of rows
nrow (DF)
ncol (DF)
DF$visina #we want to know all values in the column visina
DF$visina [2:10] #we want to know values from 2nd to 10th row in the column visina

